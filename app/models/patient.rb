class Patient < ActiveRecord::Base

	belongs_to :state
	has_one :user
	belongs_to :health_plan
	belongs_to :room
	has_many :consultations
	
	validates_presence_of :name, :message => 'Deve ser preenchido' 
	validates_presence_of :address, :message => 'Deve ser preenchido' 
	validates_presence_of :number, :message => 'Deve ser preenchido'
	validates_presence_of :district, :message => 'Deve ser preenchido' 
	validates_presence_of :city, :message => 'Deve ser preenchido'
	validates_presence_of :email
	validates_presence_of :cpf
	validates_presence_of :zip_code
	validates_presence_of :state_id
	validates_presence_of :room_id
	validates_presence_of :health_plan_id
	validates_length_of :cpf, :is => 11, :message => 'Deve ter 11 numeros'
	validates_length_of :zip_code, :is => 8, :message => 'Deve ter 8 numeros'
	validates_length_of :area_code, :is => 2, :allow_blank => true
  validates_length_of :telephone, :is => 8, :allow_blank => true
  validates_length_of :mobile, :is => 8, :allow_blank => true

end
