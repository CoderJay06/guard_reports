class ReportsController < ApplicationController 

   get '/reports' do 
      @report = Report.all 

      erb :'reports/reports'
   end 

   get '/reports/new' do 

      erb :'reports/new'
   end 


end 