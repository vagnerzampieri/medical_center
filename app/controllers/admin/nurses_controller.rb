class Admin::NursesController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	
  def index
    @nurses = Nurse.order 'name ASC'
    
    respond_with @nurses
  end
  
  def new
    @nurse = Nurse.new
    @states = State.order 'name ASC'
    @specifications = Specification.where :enabled => 1
    
    respond_with @nurse
  end
  
  def create
    @nurse = Nurse.new params[:nurse]
    @nurse.save_specifications params[:specification]
    
    respond_to do |format|
      if @nurse.save
        format.html { redirect_to(admin_nurses_url, :notice => 'Nurse was successfully created.') }
        format.xml  { render :xml => @nurse, :status => :created, :location => @nurse }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @nurse.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def show
    @nurse = Nurse.find params[:id]
    
    respond_with @nurse
  end
  
  def edit
    @nurse = Nurse.find params[:id]
    @states = State.order 'name ASC'
    
    respond_with @nurse
  end

  def update
    @nurse = Nurse.find params[:id]
    
    specification_clean = "DELETE FROM nurses_specifications WHERE user_id = #{@nurse.id}"
    ActiveRecord::Base::connection().update(specification_clean)

    @nurse.save_specifications params[:specification]

    respond_to do |format|
      if @nurse.update_attributes params[:nurse]
        format.html { redirect_to(admin_nurse_url, :notice => 'Nurse was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @nurse.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def destroy
    Nurse.find(params[:id]).destroy
		
    respond_to do |format|
      format.html { redirect_to admin_nurses_url }
      format.xml  { head :ok }
    end
  end
  
  def enable
    @nurse = Nurse.find params[:id]
    @nurse.enabled = (@nurse.enabled) ? false : true

    if @nurse.save
      flash[:success] = (@nurse.enabled) ? I18n.t(:nurse_enabled) : I18n.t(:nurse_disabled)
    else
      flash[:error] = I18n.t :nurse_enable_error
    end
    
    redirect_to admin_nurses_path
    
  end
end
