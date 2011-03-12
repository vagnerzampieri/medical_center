class Administrative < Servant
  def save_users
    user = User.create(
      :name => self.name,
      :login => self.name.mb_chars.normalize(:kd).downcase.gsub(' ', '').gsub(/\W/,''),
      :email => self.email,
      :password => self.name.mb_chars.normalize(:kd).downcase.gsub(' ', '').gsub(/\W/,''),
      :password_confirmation => self.name.mb_chars.normalize(:kd).downcase.gsub(' ', '').gsub(/\W/,''),
      :enabled => 1,
      :can_login => 1
      )        
        
    role = Role.find 3
    user.roles << role
    user.servant_id = self.id
    user.save
  end
end
