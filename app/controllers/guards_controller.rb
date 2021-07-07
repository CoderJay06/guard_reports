# frozen_string_literal: true

require './app/helpers/guard_helpers'

class GuardsController < ApplicationController
  helpers GuardHelpers

  get '/signup' do
    redirect_when_logged_in
    # render signup form page if not logged in
    erb :'guards/signup'
  end

  post '/signup' do
    @guard = Guard.new
    create_new_user(@guard)

    if @guard.save && @guard.valid?
      sign_in_user(@guard)
      redirect to "guards/#{@guard.id}"
    else
      # display error message(s) for each invalid field
      if @guard.errors.any?
        @guard.errors.full_messages.each do |error_message|
          puts "#{error_message}!"
        end
      end
      # render signup page if fields not valid
      erb :'guards/signup'
    end
  end

  get '/login' do
    redirect_when_logged_in
    # render login form  when not logged in
    erb :'guards/login'
  end

  post '/login' do
    @guard = Guard.find_by(email: params[:email])

    if @guard&.authenticate(params[:password])
      sign_in_user(@guard)
      redirect to "guards/#{@guard.id}"
    else
      # redirect if failed authentication
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/guards/:id' do
    @guard = Guard.find(params[:id])

    if @guard == current_user
      erb :'guards/show'
    else
      redirect to '/'
    end
  end
end
