class GuardsController < ApplicationController 

   get '/signup' do 

      erb :'guards/signup'
   end
   
   post '/signup' do 
      #binding.pry
      
      if !fields_empty?
         @guard = Guard.create(
            name: params[:name],
            email: params[:email],
            number: params[:number],
            password: params[:password],
            company: params[:company]
         )
         redirect to "/login"
      end 
   end 

   get '/login' do 

   end 

   get '/logout' do 

   end 
end 