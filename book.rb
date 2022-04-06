require './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def create_rental(date, person)
    Rental.new(date, self, person)
  end
end
