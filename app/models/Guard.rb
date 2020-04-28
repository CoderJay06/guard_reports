require 'active_model'

class Guard < ActiveRecord::Base
   include ActiveModel::Validations
   validates :name, presence: true
   validates :email, presence: true, format: { with: /A[^@s] @[^@s] z/, allow_blank: true }
   validates :number, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, allow_blank: true }
   has_secure_password
   has_many :reports
end 