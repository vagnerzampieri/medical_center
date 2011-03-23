class Admin::AdministrativesController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	before_filter :admin?
	
  def index
    @administratives = Administrative.order 'name ASC'
    
    respond_with @administratives
  end
  
  def new
    @administrative = Administrative.new
    @states = State.order 'name ASC'
    
    respond_with @administrative
  end
  
  def create
    @administrative = Administrative.new params[:administrative]
    
    respond_to do |format|
      if @administrative.save
        @administrative.save_users
        
        format.html { redirect_to(admin_administratives_url, :notice => 'Administrative was successfully created.') }
        format.xml  { render :xml => @administrative, :status => :created, :location => @administrative }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @administrative.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def show
    @administrative = Administrative.find params[:id]
    
    respond_with @administrative
  end
  
  def edit
    @administrative = Administrative.find params[:id]
    @states = State.order 'name ASC'
    
    respond_with @administrative
  end

  def update
    @administrative = Administrative.find params[:id]

    respond_to do |format|
      if @administrative.update_attributes params[:administrative]
        format.html { redirect_to(admin_administratives_url, :notice => 'Administrative was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @administrative.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def destroy
    Administrative.find(params[:id]).destroy
		
    respond_to do |format|
      format.html { redirect_to admin_administratives_url }
      format.xml  { head :ok }
    end
  end
  
  def enable
    @administrative = Administrative.find params[:id]
    @administrative.enabled = (@administrative.enabled) ? false : true

    if @administrative.save
      flash[:success] = (@administrative.enabled) ? I18n.t(:administrative_enabled) : I18n.t(:administrative_disabled)
    else
      flash[:error] = I18n.t :administrative_enable_error
    end
    
    redirect_to admin_administratives_path
    
  end
end
