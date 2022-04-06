require './person'
require './capitalize_decorator'
require './trimmer_decorator'
require './book'
require './rental'

person = Person.new(age: 22, name: 'maximilianus')
puts "Original name: #{person.correct_name}"
capitalizedperson = CapitalizeDecorator.new(person)
puts "Capitalized name: #{capitalizedperson.correct_name}"
capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
puts "Trimmed name: #{capitalizedtrimmedperson.correct_name}"

# ASOCIATIONS
book = Book.new('The Hobbit', 'Juan Cazares')
rental = Rental.new('01/01/2020', book, person)
puts person.rental.count
puts book.rental.count
puts rental.book.title
puts rental.date
