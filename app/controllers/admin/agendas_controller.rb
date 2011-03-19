class Admin::AgendasController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	before_filter :admin?, :skip_authorization?
	
  def index
    
  end
end
