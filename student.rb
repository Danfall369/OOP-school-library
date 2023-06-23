class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, name, parent_permission: true, classroom: nil)
    super(age, name)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom_student=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
