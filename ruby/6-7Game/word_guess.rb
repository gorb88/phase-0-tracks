#game class

class WordGuess
  attr_accessor :goal_word
  attr_accessor :current_word
  attr_accessor :guesses_left
  attr_accessor :letters_guessed
  attr_accessor :current_guess

  def initialize(word)
    @goal_word = word
    @guesses_left = word.length + 5
    @letters_guessed = []
  end

  def update_current_word
    goal_arr = @goal_word.split("")
    @current_word = []
    goal_arr.each do |x|
      if @letters_guessed.include?(x)
         @current_word << x
      else
        @current_word << "_"
      end
    end
    @current_word = @current_word.join!
  end

end