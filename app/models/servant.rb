class Servant < ActiveRecord::Base

	belongs_to :state
	has_many :doctor_specialties
  has_many :specialties, :through => :doctor_specialties
  has_and_belongs_to_many :users
  
	validates_presence_of :name, :message => 'Deve ser preenchido' 
	validates_length_of :cpf, :is => 11, :message => 'Deve ter 11 numeros'
	validates_presence_of :address, :message => 'Deve ser preenchido' 
	validates_presence_of :number, :message => 'Deve ser preenchido'
	validates_length_of :zip_code, :is => 8, :message => 'Deve ter 8 numeros'
	validates_presence_of :district, :message => 'Deve ser preenchido' 
	validates_presence_of :city, :message => 'Deve ser preenchido'
end
