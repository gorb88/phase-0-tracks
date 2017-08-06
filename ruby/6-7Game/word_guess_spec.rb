

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
    expect(game.update_current_word).to eq "h__d__"
  end

  it "Prints status" do
    game1 = WordGuess.new("hotdog")
    expect(game1.print_status).to eq "______\n You have 11 guesses left"
    game2 = WordGuess.new("slime")
    expect(game2.print_status).to eq "_____\n You have 10 guesses left"
  end

  it "Guesses a letter" do
    game = WordGuess.new("tortoise")
    game.guess("o")
    expect(game.print_status).to eq "_o__o___\n You have 12 guesses left"
  end

end