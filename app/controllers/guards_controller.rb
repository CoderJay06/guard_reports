class GuardsController < ApplicationController 

   get '/signup' do 
      # render signup form page 
      erb :'guards/signup'
   end
   
   post '/signup' do 
      #binding.pry
      
      # when all signup fields are filled out 
      # creates a new guard/user and redirects login  
      if !fields_empty?
         @guard = Guard.create(
            name: params[:name],
            email: params[:email],
            number: params[:number],
            password: params[:password],
            company: params[:company]
         )
         #raise params.inspect 
         redirect to "/login"
      else 
        # redirects back to signup if fields not filled
        redirect "/signup"
      end 
   end 

   get '/login' do 
     
    erb :'guards/login'
   end 

   get '/logout' do 

   end 
end 