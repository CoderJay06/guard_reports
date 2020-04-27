class GuardsController < ApplicationController 

   get '/signup' do 
      # render signup form page if not logged in 
      if !logged_in? 
         erb :'guards/signup'
      else 
         redirect to "/reports"
      end 
   end
   
   post '/signup' do 
      #binding.pry
      
       # redirects back to signup if fields not filled out
      if fields_empty?
        redirect to "/signup"
      else 
        # when all signup fields are filled out 
        # creates a new guard/user and redirects to login
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
    # render login form 
    erb :'guards/login'
   end 
   
   post '/login' do 
    # find current guard/user 
    @guard = Guard.find_by(email: params[:email])
  
    # validate user credentials and login if validated
    if @guard && @guard.authenticate(params[:password])
      session[:id] = @guard.id 
      redirect to "/reports"
    else 
      redirect to "/login"
    end
   end 

   get '/logout' do 
      # render the logout page if user is logged in
      if logged_in?
         erb :'guards/logout'
      else 
         # redirect to login if not logged in 
         redirect to "/login"
      end 
   end 
end 