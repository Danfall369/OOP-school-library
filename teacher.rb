require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
