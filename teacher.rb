require './person'

class Teacher < Person
  def initialize(specialization:, **options)
    super(**options)
    @specialization = specialization
  end

  def person_info
    puts "Teacher #{@id} is #{@name} is #{@age} years old, and specialization: #{@specialization} ."
  end

  def can_use_services?
    true
  end
end
