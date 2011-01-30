class AddPermissionRolesToDevel < ActiveRecord::Migration
  def self.up
    @devel = Role.find 2
    all_permissions = Permission.where(:enabled => 1)
    all_permissions.each do |permission|
      @devel.permissions << permission
    end
    @devel.save
  end

  def self.down
  end
end
