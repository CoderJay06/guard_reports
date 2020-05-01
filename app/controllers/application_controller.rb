require './config/environment'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "101fce11d312b2b21fa969badda2db9aa290b08b3cf1a80b5b586876d21d39a1364291a83594a49429f123ed7119648d5732d282ee2
    98182c10b5ec5b1de3042"
    #register Sinatra::Flash
  end
  
  # renders the index (homepage)
  get '/' do
    #flash[:notice] = "Flash is working!"
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
      @current_user = Guard.find(session[:guard_id]) if session[:guard_id]
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

    def set_report 
      @report = Report.find_by_id(params[:id])
    end 
    # # determine if user signup fields are filled out
    # def signup_fields_empty? 
    #   params[:name] == "" || params[:email] == "" || params[:company] == "" || 
    #   params[:password] == "" || params[:number] == ""
    # end 

    # # determine if create new report fields are filled out 
    # def report_fields_empty? 
    #   params[:report_type] == "" || params[:date] == "" || params[:time] == "" || 
    #   params[:location] == "" || params[:description] == ""
    # end 
  end 

end
