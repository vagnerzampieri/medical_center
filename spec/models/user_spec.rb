require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new(:name => "Nome Sobrenome", :login => "login", :email => "email@email.com", :password => "senha123", :password_confirmation => "senha123")
  end
  
  it "should be not created without name" do
    @user.name = nil 
    @user.should_not be_valid
  end
  
  it 'should be not created without login' do
    @user.login = nil
    @user.should_not be_valid
  end
  
  it 'should be not created without email' do
    @user.email = nil
    @user.should_not be_valid
  end
  
  it 'should be not created without password' do
    @user.password = nil
    @user.should_not be_valid
  end
  
  it 'should be created with all requirements' do
    @user.should be_valid
  end
  
  it 'should be created with roles' do
    role = Role.new(:name => "devel", :description => "Desenvolvedor", :enabled => 1)
    @user.roles << role
    @user.roles.should have(1).items
  end
  
end
