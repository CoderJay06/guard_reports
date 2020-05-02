

class ReportsController < ApplicationController 
   
   get '/reports' do 
      @reports = Report.all
      
      # render reports page to view all reports when logged in
      if logged_in?
         erb :'reports/reports'
      else
         redirect to "/signup"
      end 
   end 
   # render page to create a new report 
   get '/reports/new' do 
      @reports = Report.all 
       
      erb :'reports/new'
   end 

   post '/reports' do 
      # creates new reports when all form fields are filled
      @report = Report.new 
      create_new_report(@report)
      if @report.valid?
         # assign guard/user to their report
         @report.guard_id = session[:guard_id]
         @report.save
         # render report show page 
         redirect to "/reports/#{@report.id}"
      else 
         redirect to "/reports"
      end 
   end 
   # dynamic route for viewing single report
   get '/reports/:id' do 
      # find report by ID and render its show page if logged in
      set_report
      if logged_in? 
         erb :"reports/show_report"
      else 
         redirect to "/login"
      end 
   end 

   # render the edit page for a single report
   get '/reports/:id/edit' do 
      set_report

      erb :'reports/edit'
   end 

   # render delete page for a single report
   get '/reports/:id/delete' do 
      set_report

      erb :'reports/delete'
   end 

   patch '/reports/:id' do 
      set_report
      
      # update report if reports owner is the logged in user/guard
      # and user input is valid
      if reports_authorized_user?(@report) && @report.valid?
         update_report(@report)
         # redirect to reports show page
         redirect to "/reports/#{@report.id}"
      else 
         # if logged in user/guard is not reports owner display warning
         puts "You can not edit another guards report!"
         redirect to "/reports"
      end 
   end 

   delete '/reports/:id' do 
      set_report

      # delete report if reports owner is the logged in user/guard
      if reports_authorized_user?(@report)
         @report.delete
         redirect to "/reports"
      else 
         # if logged in user/guard is not reports owner display warning
         puts "You can not delete another guards report!"
         redirect to "/reports"
      end 
   end 
      
end 