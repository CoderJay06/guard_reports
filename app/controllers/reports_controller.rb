class ReportsController < ApplicationController 

   get '/reports' do 
      @reports = Report.all 
      if logged_in?
         erb :'reports/reports'
      else 
         redirect to "/signup"
      end 
   end 

   get '/reports/new' do 
      @reports = Report.all 

      erb :'reports/new'
   end 

   post '/reports' do 
      #raise params.inspect
      if report_fields_empty?
         redirect to "/reports/new"
      else 
         Report.create(
            report_type: params[:report_type],
            date: params[:date],
            time: params[:time],
            location: params[:location],
            description: params[:description]
         )
         redirect to "/reports"
      end 
   end 

end 