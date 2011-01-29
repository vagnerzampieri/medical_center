module Admin::DoctorsHelper
  
  def select_specialty(number)
    @doctor.doctor_specialties.each do |doctor|
      if doctor.number == number
        @d = doctor.specialty_id
      end
    end
    puts @d
    @d
  end
  
end
