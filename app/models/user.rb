class User < ActiveRecord::Base

  has_and_belongs_to_many :roles
  has_one :servant
  has_one :patient

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :login, :enabled, :can_login, :email, :password, :password_confirmation, :servant_id, :patient_id
  
  validates_presence_of :name, :login
end
