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
    self.update_current_word
  end

  def update_current_word
    goal_arr = @goal_word.split("")
    @current_word = []
    goal_arr.each do |letter|
      if @letters_guessed.include?(letter)
         @current_word << letter
      else
        @current_word << "_"
      end
    end
    @current_word = @current_word.join
  end

  def guess(letter)
    if !letters_guessed.include?(letter)
      @guesses_left -= 1
      @letters_guessed << letter
      if @goal_word.include?(letter)
       puts "A hit! Good job."
      else
        puts "Wrong"
     end
    else
      print "You already guessed that letter"
    end
    self.update_current_word
  end

  def print_status
    status = "#{@current_word}\n You have #{@guesses_left} guesses left"
    puts status
    status
  end

end