class User < ActiveRecord::Base
  attr_accessible :city_id, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :biography, :website, :twitter, :linked_in, :github
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :city
  has_many :reviews, :dependent => :nullify
  has_many :venue_suggestions, :dependent => :nullify
  has_many :check_ins, :dependent => :destroy

  validates :first_name, :last_name, :presence => true

  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end
  
end
