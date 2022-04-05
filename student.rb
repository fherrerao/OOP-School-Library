require './person'

class Student < Person
  def initialize(classroom:, **options)
    super(**options)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
