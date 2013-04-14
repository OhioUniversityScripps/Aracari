class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

end
