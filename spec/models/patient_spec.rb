require 'spec_helper'

describe Patient do
  before(:each) do
    @patient = Patient.new(:name => "Nome Sobrenome", :birth => "2002-02-22", :sex => "Maculino", :cpf => "12345678901", :state_id => 19, :email => "teste@medicalcenter.com", :address => "Baba das Coves", :number => "1000", :complement => "casa 1", :zip_code => "21311411", :district => "Baba das Coves", :city => "Rio de Janeiro", :area_code => "21", :telephone => "21212121", :mobile => "91919191", :enabled => 1)
  end
  
  it 'should be not created without name' do
    @patient.name = ''
    @patient.should_not be_valid
  end
  
  it 'should be not created without cpf' do
    @patient.cpf = ''
    @patient.should_not be_valid
  end
  
end
