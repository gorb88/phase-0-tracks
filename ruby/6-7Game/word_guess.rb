#game class

class WordGuess
  attr_accessor :goal_word
  attr_accessor :current_word
  attr_accessor :guesses_left
  attr_accessor :letters_guessed

  def initialize(word)
    @goal_word = word.downcase
    @guesses_left = word.length + 5
    @letters_guessed = []
    @divider = "\n" + "<<>>"*15
    self.update_current_word
  end

  def update_current_word
    goal_arr = @goal_word.split("")
    @current_word = []
    goal_arr.each do |letter|
      if @letters_guessed.include?(letter)
         @current_word << letter
      else
        @current_word << "-"
      end
    end
    @current_word = @current_word.join
  end

  def guess(letter)
    if !letters_guessed.include?(letter)
      @guesses_left -= 1
      @letters_guessed << letter
      puts @divider
      if @goal_word.include?(letter)
        puts "\nA hit! Good job."
      else
        puts "\nWrong! "
     end
    else
      print "You already guessed that letter\n"
    end
    self.update_current_word
  end

  def print_status
    status = "\n#{@current_word}\nYou have #{@guesses_left} guesses left\n"
    puts status
    puts @divider
    #returns this for testing
    status
  end

  def is_game_over?
    @guesses_left <= 0 || @current_word == @goal_word
  end

  def results
    if @current_word == @goal_word
      puts "\nPlayer 2 guessed the word! The word was #{@goal_word}!"
    elsif @guesses_left <= 0
      puts "\nPlayer 1 outfoxed Player 2! The word was #{@goal_word}!"
    end
  end

end


#user interface

def interface
  puts "\nLets play..."
  puts "Guess... that.... WORD\n\n"
  puts "Player 1 enter a word:"
  game = WordGuess.new(gets.chomp)

  1000.times {puts "\n\n"}
  puts "Thank you Player 1, now Player 2 has #{game.guesses_left} tries to guess the word!"

  until game.is_game_over?
    game.print_status
    puts "\nPlayer 2, enter a letter:"
    game.guess(gets.chomp)
  end
  game.results
end

interface