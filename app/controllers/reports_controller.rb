class ReportsController < ApplicationController 

   get '/reports' do 
      if logged_in?
         @reports = Report.all 
         erb :'reports/reports'
      else 
         redirect to "/signup"
      end 
   end 

   get '/reports/new' do 

      erb :'reports/new'
   end 


end 