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
      case gets.chomp
      when '1', '2', '3'
        tasks_1_3
      when '4', '5', '6'
        tasks_5_5
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

  def tasks_1_3
    case gets.chomp
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person    
  end

  def tasks_4_7

  def list_books
    puts "BOOKS:\n"
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

    case type
    when 's'
      puts 'Please enter the name of the student:'
      name = gets.chomp
      puts 'Please enter the age of the student:'
      age = gets.chomp.to_i
      puts 'Please enter the parent permission of the student (Y/N):'
      parent_permission = gets.chomp.upcase

      case parent_permission
      when 'Y'
        parent_permission = true
      when 'N'
        parent_permission = false
      else
        puts 'Invalid input'
        return
      end
      @people << Student.new(age: age, name: name, parent_permission: parent_permission)
      puts 'Student created successfully!'
    when 't'
      puts 'Please enter the name of the teacher:'
      name = gets.chomp
      puts 'Please enter the age of the teacher:'
      age = gets.chomp.to_i
      puts 'Please enter the specialization of the teacher:'
      specialization = gets.chomp
      @people << Teacher.new(age: age, name: name, specialization: specialization)
      puts 'Teacher created successfully!'
    else
      puts 'Invalid input'
      nil
    end
  end

  def create_book
    puts 'Enter title:'
    title = gets.chomp
    puts 'Enter author:'
    author = gets.chomp

    @books << Book.new(title, author)
  end

  def create_rental
    list_books
    puts 'Enter the number of the book:'
    book_number = gets.chomp.to_i
    puts 'Select a person from the following list by number:'
    list_people
    puts 'Enter the number of the person:'
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
