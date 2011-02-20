class User < ActiveRecord::Base
  attr_accessible :city_id, :email, :password, :password_confirmation, :remember_me, :biography, :website, :twitter, :linked_in, :github
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :city
  
end
