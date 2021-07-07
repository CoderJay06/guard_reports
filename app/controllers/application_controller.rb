# frozen_string_literal: true

require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  # renders the index (homepage)
  get '/' do
    erb :index
  end
  # helper methods for controllers
  helpers do
    # true if user/guard is logged in else false
    def logged_in?
      # boolean expression of current_user objects truthiness
      !!current_user
    end

    def current_user
      # assign current user with session id if it exists
      @current_user = Guard.find(session[:guard_id]) if session[:guard_id]
    end

    def redirect_when_not_logged_in
      redirect to '/login' unless logged_in?
    end

    def redirect_when_logged_in
      redirect to '/reports' if logged_in?
    end
  end
end
