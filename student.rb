require './person'

class Student < Person
  attr_accessor :classrooms

  def initialize(classroom:, **options)
    super(**options)
    @classroom = classroom
  end

  def classroom=(classrooms)
    @classrooms = classrooms
    classrooms.students << self unless classrooms.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
