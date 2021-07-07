# frozen_string_literal: true

require './app/helpers/report_helpers'

class ReportsController < ApplicationController
  helpers ReportHelpers

  get '/reports' do
    redirect_when_not_logged_in
    @reports = Report.all

    erb :'reports/reports'
  end

  get '/reports/new' do
    redirect_when_not_logged_in
    @reports = Report.all

    erb :'reports/new'
  end

  post '/reports' do
    redirect_when_not_logged_in
    @report = Report.new
    create_new_report(@report)
    # when validated assign guard/user to their report
    if @report.save && @report.valid?
      associate_report_with_user(@report)
      redirect to "/reports/#{@report.id}"
    else
      redirect to '/reports'
    end
  end

  get '/reports/:id' do
    redirect_when_not_logged_in
    set_report

    erb :'reports/show_report'
  end

  get '/reports/:id/edit' do
    redirect_when_not_logged_in
    set_report
    if reports_authorized_user?(@report)
      erb :'reports/edit'
    else
      redirect to '/reports'
    end
  end

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

    if reports_authorized_user?(@report) && !report_fields_empty?
      update_report(@report)
      redirect to "/reports/#{@report.id}"
    else
      redirect to '/reports'
    end
  end

  delete '/reports/:id' do
    redirect_when_not_logged_in
    set_report

    if reports_authorized_user?(@report)
      @report.destroy
    else
      puts 'You can not delete another guards report!'
    end
    redirect to '/reports'
  end
end
