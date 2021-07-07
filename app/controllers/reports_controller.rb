# frozen_string_literal: true

require './app/helpers/report_helpers'

class ReportsController < ApplicationController
  helpers ReportHelpers

  # render reports page to view all reports
  get '/reports' do
    redirect_when_not_logged_in
    @reports = Report.all

    erb :'reports/reports'
  end
  # render page to create a new report
  get '/reports/new' do
    redirect_when_not_logged_in
    @reports = Report.all

    erb :'reports/new'
  end

  post '/reports' do
    redirect_when_not_logged_in
    # creates new reports when all form fields are valid
    @report = Report.new
    create_new_report(@report)
    # when validated assign guard/user to their report
    if @report.save && @report.valid?
      associate_report_with_user(@report)
      # render report show page
      redirect to "/reports/#{@report.id}"
    else
      redirect to '/reports'
    end
  end
  # dynamic route for viewing single report
  get '/reports/:id' do
    # find report by ID and render its show page if logged in
    redirect_when_not_logged_in
    set_report

    erb :'reports/show_report'
  end

  # render the edit page for a single report
  get '/reports/:id/edit' do
    redirect_when_not_logged_in
    set_report
    if reports_authorized_user?(@report)
      erb :'reports/edit'
    else
      redirect to '/reports'
    end
  end

  # render delete page for a single report
  get '/reports/:id/delete' do
    redirect_when_not_logged_in
    set_report
    if reports_authorized_user?(@report)
      erb :'reports/delete'
    else
      redirect to '/reports'
    end
  end

  patch '/reports/:id' do
    redirect_when_not_logged_in
    set_report
    # update report if reports owner is the logged in user/guard
    # and user input is valid
    if reports_authorized_user?(@report) && !report_fields_empty?
      update_report(@report)
      # redirect to reports show page
      redirect to "/reports/#{@report.id}"
    else
      # if logged in user/guard is not reports owner
      # or any update report fields are not filled out
      redirect to '/reports'
    end
  end

  delete '/reports/:id' do
    redirect_when_not_logged_in
    set_report
    # delete report if reports owner is the logged in user/guard
    if reports_authorized_user?(@report)
      @report.destroy
    else
      # if logged in user/guard is not reports owner display warning
      puts 'You can not delete another guards report!'
    end
    redirect to '/reports'
  end
end
