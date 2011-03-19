class DashboardController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	before_filter :admin?
	
	def index
	  
 end
end
