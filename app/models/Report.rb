# frozen_string_literal: true

require 'active_model'

class Report < ActiveRecord::Base
  include ActiveModel::Validations
  validates :report_type, :location, :description,
            presence: true
  belongs_to :guard
end
