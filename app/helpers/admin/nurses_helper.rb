module Admin::NursesHelper
  def show_specification(nurse)
    specification_td = "<td>"
    nurse.specifications.each do |specification|
      specification_td << specification.name
      specification_td << "<br/>"
    end
    specification_td << "</td>"
    raw specification_td
  end
end
