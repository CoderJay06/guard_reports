class GuardsController < ApplicationController 

   get '/signup' do 
      # render signup form page 
      erb :'guards/signup'
   end
   
   post '/signup' do 
      #binding.pry
      
       # redirects back to signup if fields not filled out
      if fields_empty?
        redirect to "/signup"
      else 
        # when all signup fields are filled out 
        # creates a new guard/user and redirects login
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
     
    erb :'guards/login'
   end 

   get '/logout' do 

   end 
end 