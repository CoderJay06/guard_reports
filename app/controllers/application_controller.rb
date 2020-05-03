require './config/environment'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
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
      # boolean expression of current_user objects truthiness
      !!current_user
    end 
    
    def current_user 
      # assign current user with session id if it exists
      @current_user = Guard.find(session[:guard_id]) if session[:guard_id]
    end
    
    def redirect_when_not_logged_in 
      if !logged_in? 
        redirect to "/login?error=You have to be logged in to do that"
      end 
    end 

    def sign_in_user(user)
      session[:guard_id] = user.id 
    end 

    def create_new_user(user)
      user.name = params[:name]
      user.email = params[:email]
      user.number = params[:number]
      user.password = params[:password]
      user.company = params[:company]
      user.save
    end 

    def create_new_report(report)
      report.report_type = params[:report_type]
      report.date = params[:date]
      report.time = params[:time]
      report.location = params[:location]
      report.description = params[:description]
      report.save
    end 
    
    def update_report(report)
      report.update(
        report_type: params[:report_type],
        date: params[:date],
        time: params[:time],
        location: params[:location],
        description: params[:description]
     )
    end 

    def report_fields_empty?
      params[:report_type] == "" || params[:date] == "" || params[:time] == "" || 
      params[:location] == "" || params[:description] == ""
    end 

    def set_report 
      @report = Report.find_by_id(params[:id])
    end 

    def redirect_when_not_logged_in 
      if !logged_in? 
        redirect to "/login"
      end 
    end 

    def redirect_when_logged_in 
      if logged_in? 
        redirect to "/reports"
      end 
    end 

    def reports_authorized_user?(report)
      report.guard == current_user 
    end 
  end 

end
