class Doctor < Servant

  def save_doctor_specialties(specialties)
    specialties.each_pair do |key, value|
      if value == "1"
        DoctorSpecialty.create(
          :servant_id => self.id,
          :specialty_id => key
        )
      end
    end
  end
  
  def save_doctor_health_plans(health_plans)
    health_plans.each_pair do |key, value|
      if value == "1"
        DoctorHealthPlan.create(
          :servant_id => self.id,
          :health_plan_id => key
        )
      end
    end
  end  
  
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
        
    role = Role.find 4
    user.roles << role
    user.servant_id = self.id
    user.save
  end

end
