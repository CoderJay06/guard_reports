require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "101fce11d312b2b21fa969badda2db9aa290b08b3cf1a80b5b586876d21d39a1364291a83594a49429f123ed7119648d5732d282ee2
    98182c10b5ec5b1de3042"
  end
  
  # renders the index (homepage)
  get '/' do
    erb :index
  end
  # helper methods for controllers
  helpers do 
    # true if user/guard is logged in else false
    def logged_in?
      # boolean expression of objects truthiness
      !!current_user
    end 
    
    def current_user 
      @current_user ||= Guard.find_by(session[:guard_id]) if session[:guard_id]
    end 
    
    # determine if user signup fields are filled out
    def fields_empty? 
      params[:name] == "" || params[:email] == "" || params[:company] == "" || 
      params[:password] == "" || params[:number] == ""
    end 
  end 

end
