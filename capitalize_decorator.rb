require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end
