require 'active_model'

class Report < ActiveRecord::Base 
   include ActiveModel::Validations
   belongs_to :guard
end 