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
      #raise params.inspect
      if report_fields_empty?
         redirect to "/reports/new"
      else 
        #binding.pry
         @report = Report.create(
            report_type: params[:report_type],
            date: params[:date],
            time: params[:time],
            location: params[:location],
            description: params[:description]
         )
         # assign guard/user to their report
         @report.guard_id = session[:guard_id]
         # render report show page 
         redirect to "/reports/#{@report.id}"
      end 
   end 

   get '/reports/:id/edit' do 
      @report = Report.find_by_id(params[:id])

      erb :'reports/edit'
   end 

   get '/reports/:id' do 
      #binding.pry
      @report = Report.find_by_id(params[:id])
      if logged_in? 
         erb :"reports/show_report"
      else 
         redirect to "/login"
      end 
   end 

   patch '/reports/:id' do 
      binding.pry
      @report = Report.find_by_id(params[:id])
   end 
  
end 