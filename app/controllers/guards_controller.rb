require './app/helpers/guard_helpers'

class GuardsController < ApplicationController
  helpers GuardHelpers

  get '/signup' do
    redirect_when_logged_in
    # render signup form page if not logged in
    erb :'guards/signup'
  end

  post '/signup' do
    # creates a new guard/user when valid
    @guard = Guard.new
    create_new_user(@guard)
    # log in user/guard when created fields are valid
    # then redirect to their show page
    if @guard.save && @guard.valid?
      sign_in_user(@guard)
      redirect to "guards/#{@guard.id}"
    else
      # display error message(s) for each invalid field
      if @guard.errors.any?
        @guard.errors.full_messages.each do |error_message|
          puts error_message + '!'
        end
      end
      # renders signup page if fields not valid
      erb :'guards/signup'
    end
  end

  get '/login' do
    redirect_when_logged_in
    # render login form  when not logged in
    erb :'guards/login'
  end

  post '/login' do
    # find current guard/user
    @guard = Guard.find_by(email: params[:email])

    # validate guard/user credentials, login if validated
    # then redirect to their show page
    if @guard && @guard.authenticate(params[:password])
      sign_in_user(@guard)
      redirect to "guards/#{@guard.id}"
    else
      # redirect back if credentials not validated
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      # logout the user/guard and redirect to login
      session.destroy
      redirect to '/login'
    else
      # redirect to homepage if not logged in
      redirect to '/'
    end
  end

  # dynamic route for a single user/guard
  get '/guards/:id' do
    # find current user/guard by ID
    @guard = Guard.find(params[:id])
    # when current user render their profile page
    if @guard == current_user
      erb :'guards/show'
    else
      redirect to '/'
    end
  end
end
