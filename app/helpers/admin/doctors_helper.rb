module Admin::DoctorsHelper
 
  def show_specialty(doctor)
    specialties_td = "<td>"
    doctor.specialties.each do |specialty|
      specialties_td << specialty.name
      specialties_td << "<br/>"
    end
    specialties_td << "</td>"
    raw specialties_td
  end
  
  def show_health_plan(doctor)
    health_plans_td = "<td>"
    doctor.health_plan.each do |health_plan|
      health_plans_td << health_plan.name
      health_plans_td << "<br/>"
    end
    health_plans_td << "</td>"
    raw health_plans_td
  end
  
end
