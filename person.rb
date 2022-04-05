class Person
  attr_accessor :id, :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true, id: Random.rand(1..1000))
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
