require 'active_model'

class Guard < ActiveRecord::Base
   include ActiveModel::Validations
   validates :name, :email, :company, presence: true  
   validates :number, presence: true, :format =>
   {:with => /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/}
   validates :email, uniqueness: true, 
   :format => {:with => /\w+@\w+\.\w+/}
   has_secure_password
   has_many :reports

end 