class Admin::AgendasController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	before_filter :admin?, :check_authorization
	
  def index
    
  end
end
