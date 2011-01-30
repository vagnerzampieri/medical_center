class AddPermissions < ActiveRecord::Migration
  def self.up
    remove_index :permissions, :name
    remove_column :permissions, :name
    remove_column :permissions, :description
    
    all_controllers = %w(ApplicationController HomeController Admin::AdministrativesController Admin::DoctorsController Admin::NursesController Admin::PatientsController Admin::ServantsController Admin::UsersController)
    all_controllers.each do |contrs|
      cs = contrs.constantize
      cs.action_methods.each do |acts|
        Permission.create(
          :controller => cs,
          :action => acts,
          :enabled => true,
          :created_at => Time.now.strftime("%Y-%m-%d %H:%M:%S"),
          :updated_at => Time.now.strftime("%Y-%m-%d %H:%M:%S")
        )
      end
    end
  end

  def self.down
  end
end
