

require_relative 'word_guess'

describe WordGuess do
  it "Initializes new game" do
    game = WordGuess.new("hotdog")
    expect(game.class.to_s).to eq "WordGuess"
    expect(game.goal_word).to eq "hotdog"
  end

  it "Updates current word" do
    game = WordGuess.new("hotdog")
    game.letters_guessed = ["e", "d", "s", "h"]
    expect(game.update_current_word).to eq "h--d--"
  end

  it "Prints status" do
    game1 = WordGuess.new("hotdog")
    expect(game1.print_status).to eq "\n------\nYou have 11 guesses left\n"
    game2 = WordGuess.new("slime")
    expect(game2.print_status).to eq "\n-----\nYou have 10 guesses left\n"
  end

  it "Guesses a correct letter" do
    game = WordGuess.new("tortoise")
    game.guess("o")
    expect(game.print_status).to eq "\n-o--o---\nYou have 12 guesses left\n"
  end
    it "Guesses an incorrect letter" do
    game = WordGuess.new("tortoise")
    game.guess("z")
    expect(game.print_status).to eq "\n--------\nYou have 12 guesses left\n"
  end

  it "Checks to see if ran out of guesses" do
    game = WordGuess.new("babylon")
    game.guesses_left = 0
    expect(game.is_game_over?).to eq true
  end

  it "Checks to see if you won" do
    game = WordGuess.new("babylon")
    game.current_word = game.goal_word
    expect(game.is_game_over?).to eq true
  end

  it "Checks to see if game is over, but it's not" do
    game = WordGuess.new("babylon")
    expect(game.is_game_over?).to eq false
  end

  it "prints results" do
    expect do
      game = WordGuess.new("babylon")
      game.guesses_left = 0
      game.results
    end.to output("\nPlayer 1 outfoxed Player 2! The word was babylon!\n").to_stdout
  end

  it "prints results" do
    expect do
      game = WordGuess.new("babylon")
      game.current_word = game.goal_word
      game.results
    end.to output("\nPlayer 2 guessed the word! The word was babylon!\n").to_stdout
  end

end