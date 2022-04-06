class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.length > 9 ? @nameable.correct_name[0..8] + '...' : @nameable.correct_name
  end
end
