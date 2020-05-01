

class ReportsController < ApplicationController 
   
   # render reports page to view all reports when logged in
   get '/reports' do 
      @reports = Report.all 
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
   # creates new reports when all form fields are filled
   post '/reports' do 
      @report = Report.new 
      create_new_report(@report)
      #binding.pry 
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
      # find report by ID and render show page if logged in
      @report = Report.find_by_id(params[:id])
      if logged_in? 
         erb :"reports/show_report"
      else 
         redirect to "/login"
      end 
   end 

   # render the edit page for a single report
   get '/reports/:id/edit' do 
      @report = Report.find_by_id(params[:id])
  
      erb :'reports/edit'
   end 

   # render delete page for a single report
   get '/reports/:id/delete' do 
      @report = Report.find_by_id(params[:id])

      erb :'reports/delete'
   end 

   patch '/reports/:id' do 
      #binding.pry
      @report = Report.find_by_id(params[:id])
      # update report if reports owner is the logged in user/guard
      if @report.guard == current_user
         @report.update(
            report_type: params[:report_type],
            date: params[:date],
            time: params[:time],
            location: params[:location],
            description: params[:description]
         )
         # redirect to reports show page
         redirect to "/reports/#{@report.id}"
      else 
         # if logged in user/guard is not reports owner display warning
         puts "You can not edit another guards report!"
         redirect to "/reports"
      end 
   end 

   delete '/reports/:id' do 
      @report = Report.find_by_id(params[:id]) 
      #binding.pry
      # delete report if reports owner is the logged in user/guard
      if @report.guard == current_user
         @report.delete
         redirect to "/reports"
      else 
         # if logged in user/guard is not reports owner display warning
         puts "You can not delete another guards report!"
         redirect to "/reports"
      end 
   end 
      
end 