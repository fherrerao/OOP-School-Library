#!/usr/bin/env ruby
require './person'
require './book'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @people = []
    @books = []
  end

  def menu
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  def selection
    loop do
      menu
      selection = gets.chomp
      case selection
      when '1', '2', '3'
        tasks_one_to_three(selection)
      when '4', '5', '6'
        tasks_four_to_six(selection)
      when '7'
        exit
      else
        puts 'Invalid input'
      end
    end
  end

  def run
    puts 'Welcome to School Library App!'
    puts
    puts 'Please select an option by enterin a number:'
    selection
  end

  def tasks_one_to_three(selection)
    case selection
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    end
  end

  def tasks_four_to_six(selection)
    case selection
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts 'Invalid input'
    end
  end

  def list_books
    puts "BOOKS :\n"
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Title: #{book.title} Author: #{book.author}"
    end
  end

  def list_people
    puts "PEOPLE:\n"
    @people.each_with_index do |person, index|
      puts "#{index + 1}) Id: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student or a teacher? (S/T)'
    type = gets.chomp.downcase
    type == 's' ? create_student(type) : create_teacher(type)
  end

  def create_student(_type)
    puts 'Please enter the name of the student:'
    name = gets.chomp
    puts 'Please enter the age of the student:'
    age = gets.chomp.to_i
    puts 'Please enter if the student has a parent permission (Y/N):'
    parent_permission = gets.chomp.downcase
    @people << Student.new(age: age, name: name, parent_permission: parent_permission)
    puts 'Student created successfully!'
  end

  def create_teacher(_type)
    puts 'Please enter the name of the teacher:'
    name = gets.chomp
    puts 'Please enter the age of the teacher:'
    age = gets.chomp.to_i
    puts 'Please enter the specialization of the teacher:'
    specialization = gets.chomp
    @people << Teacher.new(age: age, name: name, specialization: specialization)
    puts 'Teacher created successfully!'
  end

  def create_book
    puts 'Enter title:'
    title = gets.chomp
    puts 'Enter author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_books
    book_number = gets.chomp.to_i
    puts 'Select a person from the following list by number:'
    list_people
    person_number = gets.chomp.to_i
    puts 'Enter the date of the rental (dd/mm/yyyy):'
    date = gets.chomp
    @books[book_number - 1].create_rental(date, @people[person_number - 1])
    puts 'Rental created successfully!'
  end

  def list_rentals
    list_people
    puts 'Enter the id of the person:'
    id = gets.chomp.to_i
    puts 'RENTALS: '
    @people.each do |person|
      next unless person.id == id

      person.rental.each do |rental|
        puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end
end

def main
  app = App.new
  app.run
end

main
