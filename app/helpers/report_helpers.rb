module ReportHelpers 
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

    def associate_report_with_user(report)
      @guard = current_user
      @guard.reports.build(
        report_type: report.report_type,
        date: report.date,
        time: report.time,
        location: report.location,
        description: report.description
      )
      report.guard = @guard 
      report.save
    end 

  def reports_authorized_user?(report)
    report.guard == current_user 
  end 

end 