class Nurse < Servant
  has_and_belongs_to_many :specifications
  
  def save_specifications(specifications)
    specifications.each_value do |id|
      specification = Specification.find id
      self.specifications << specification
    end
  end
end
