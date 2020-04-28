require 'active_model'

class Report < ActiveRecord::Base 
   include ActiveModel::Validations
   validates :report_type, :date, :time, :location, :description,
   presence: true
   belongs_to :guard
end 