class User < ActiveRecord::Base
  attr_accessible :city_id, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :biography, :website, :twitter, :linked_in, :github
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :city
  has_many :reviews
  has_many :venue_suggestions
  has_many :check_ins

  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end
  
end
