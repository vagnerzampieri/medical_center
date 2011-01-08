class Admin::ServantsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml
	
  def index
    @servants = Servant.order('name ASC')
    
    respond_with @servants
  end
end
