require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "101fce11d312b2b21fa969badda2db9aa290b08b3cf1a80b5b586876d21d39a1364291a83594a49429f123ed7119648d5732d282ee2
    98182c10b5ec5b1de3042"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!session[:id]
    end 

    def current_user 
      Guard.find_by(session[:id])
    end 
  end 

end
