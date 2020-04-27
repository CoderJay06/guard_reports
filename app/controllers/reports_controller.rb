class ReportsController < ApplicationController 

   get '/reports' do 
      @reports = Report.all 
      @guard = Guard.find_by(params[:id])
      erb :'reports/reports'
   end 

   get '/reports/new' do 

      erb :'reports/new'
   end 


end 