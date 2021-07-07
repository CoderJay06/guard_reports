# frozen_string_literal: true

require 'active_model'

class Guard < ActiveRecord::Base
  include ActiveModel::Validations
  validates :name, :email, :company, presence: true
  validates :number, presence: true, format:   { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/ }
  validates :email, uniqueness: true,
                    format: { with: /\w+@\w+\.\w+/ }
  validates :password, length: { in: 4..20 }
  has_secure_password
  has_many :reports
end
