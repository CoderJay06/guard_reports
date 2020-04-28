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
      # creates a new guard/user 
      @guard = Guard.create(
         name: params[:name],
         email: params[:email],
         number: params[:number],
         password: params[:password],
         company: params[:company]
      )
      # log in user/guard when created fields are valid
      # then redirect to their show page
      if @guard.valid?
         session[:guard_id] = @guard.id 
         redirect to "guards/#{@guard.id}"
      else 
         # redirects back to signup if fields not valid or empty
         redirect to "/signup"
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
      session[:guard_id] = @guard.id 
      redirect to "guards/#{@guard.id}"
    else 
      # redirect back if credentials not validated
      redirect to "/login"
    end
   end 

   get '/logout' do 
      # render the logout page if user is logged in
      #binding.pry
      if logged_in?
         erb :'guards/logout'
      else 
         # redirect to homepage if not logged in 
         redirect to "/"
      end 
   end 

   post '/logout' do 
      #logout the user/guard and redirect to login
      session.clear 
      redirect to "/login"
   end 
   # dynamic route for a single user/guard
   get '/guards/:id' do 
      # find current user/guard by ID
      @guard = Guard.find_by_id(params[:id])

      # render their show page
      erb :'guards/show'
   end 

end 