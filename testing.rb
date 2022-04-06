require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(age: 22, name: 'maximilianus')
person.correct_name
capitalizedperson = CapitalizeDecorator.new(person)
puts capitalizedperson.correct_name
capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
puts capitalizedtrimmedperson.correct_name
