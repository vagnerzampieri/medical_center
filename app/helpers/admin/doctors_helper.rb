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
  
end
