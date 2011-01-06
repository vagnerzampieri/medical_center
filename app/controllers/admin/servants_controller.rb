class Admin::ServantsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml
	
  def index
    @servants = Servant.all(:order => 'name ASC')
    
    respond_with @patients
  end
end
