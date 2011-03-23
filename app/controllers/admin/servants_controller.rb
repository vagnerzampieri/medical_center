class Admin::ServantsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	before_filter :admin?
	
  def index
    @servants = Servant.order 'name ASC'
    
    respond_with @servants
  end
end
