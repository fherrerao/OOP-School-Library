require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :id, :name, :age, :rental

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    super()
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def create_rental(date, book, _person)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
