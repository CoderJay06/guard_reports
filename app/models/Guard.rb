require 'active_model'

class Guard < ActiveRecord::Base
   include ActiveModel::Validations
   validates :name, :email, :number, :password, :company,
   presence: true  
   validates :email, uniqueness: true

   has_secure_password
   has_many :reports
end 