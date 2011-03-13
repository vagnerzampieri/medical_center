require 'spec_helper'

describe Patient do
  before(:each) do
    @patient = Patient.new(:name => "Nome Sobrenome", :birth => "2002-02-22", :sex => "Maculino", :cpf => "12345678901", :state_id => 19, :email => "teste@medicalcenter.com", :address => "Baba das Coves", :number => "1000", :complement => "casa 1", :zip_code => "21311411", :district => "Baba das Coves", :city => "Rio de Janeiro", :area_code => "21", :telephone => "21212121", :mobile => "91919191", :enabled => 1, :room_id => 1, :health_plan_id => 2)
  end
  
  it 'should be not created without name' do
    @patient.name = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created without address' do
    @patient.address = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created without number' do
    @patient.number = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created without district' do
    @patient.district = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created without email' do
    @patient.email = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created without city' do
    @patient.city = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created without cpf' do
    @patient.cpf = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created with greater cpf 11 digits' do
    @patient.cpf = '123456789012'
    @patient.should_not be_valid
  end
  
  it 'should be not created with less cpf 11 digits' do
    @patient.cpf = '1234567890'
    @patient.should_not be_valid
  end
  
  it 'should be not created without zip code' do
    @patient.zip_code = nil
    @patient.should_not be_valid
  end
  
  it 'should be not created with greater zip code 8 digits' do
    @patient.zip_code = '123456789'
    @patient.should_not be_valid
  end
  
  it 'should be not created with less zip code 8 digits' do
    @patient.zip_code = '1234567'
    @patient.should_not be_valid
  end
  
  it 'should be created without area code' do
    @patient.area_code = nil
    @patient.should be_valid
  end
  
  it 'should be not created with greater area code 2 digits' do
    @patient.area_code = '123'
    @patient.should_not be_valid
  end
  
  it 'should be not created with less area code 2 digits' do
    @patient.area_code = '1'
    @patient.should_not be_valid
  end
  
  it 'should be created without telephone' do
    @patient.telephone = nil
    @patient.should be_valid
  end
  
  it 'should be not created with greater telephone 8 digits' do
    @patient.telephone = '123456789'
    @patient.should_not be_valid
  end
  
  it 'should be not created with less telephone 8 digits' do
    @patient.telephone = '1234567'
    @patient.should_not be_valid
  end
  
  it 'should be created without mobile' do
    @patient.mobile = nil
    @patient.should be_valid
  end
  
  it 'should be not created with greater mobile 8 digits' do
    @patient.mobile = '123456789'
    @patient.should_not be_valid
  end
  
  it 'should be not created with less mobile 8 digits' do
    @patient.mobile = '1234567'
    @patient.should_not be_valid
  end
  
  it 'should be not created without state' do
    @patient.state_id = nil
    @patient.should_not be_valid
  end
  
  it 'should be created with state' do
    state = State.new(:id => 1, :name => 'Rio de Janeiro', :acronym => 'RJ')
    state.save
    @patient.state_id = state.id
    @patient.should be_valid
  end
  
  it 'should be not created without room' do
    @patient.room_id = nil
    @patient.should_not be_valid
  end
  
  it 'should be created with room' do
    room = Room.new(:id => 1, :name => 'Particular')
    room.save
    @patient.room_id = room.id
    @patient.should be_valid
  end
  
  it 'should be not created without health plan' do
    @patient.health_plan_id = nil
    @patient.should_not be_valid
  end
  
  it 'should be created with health plan' do
    health_plan = HealthPlan.new(:id => 1, :name => 'Dix Classic Essencial', :enabled => 1)
    health_plan.save
    @patient.health_plan_id = health_plan.id
    @patient.should be_valid
  end
  
  it 'should be created with all requirements' do
    @patient.should be_valid
  end
  
end
