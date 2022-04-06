require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, **options)
    super(**options)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
