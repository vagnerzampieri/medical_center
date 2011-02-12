module Admin::DoctorsHelper
  
  def select_specialty(number)
    @doctor.doctor_specialties.each do |doctor|
      if doctor.number == number
        @specialty_id = doctor.specialty_id
      end
    end
    @specialty_id
  end
  
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
