class Guard < ActiveRecord::Base
   has_secure_password
   has_many :reports
end 