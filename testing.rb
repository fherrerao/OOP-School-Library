require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(age: 22, name: 'maximilianus')
puts "Original name: #{person.correct_name}"
capitalizedperson = CapitalizeDecorator.new(person)
puts "Capitalized name: #{capitalizedperson.correct_name}"
capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
puts "Trimmed name: #{capitalizedtrimmedperson.correct_name}"
