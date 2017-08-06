

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
    game = WordGuess.new("hotdog")
    expect(game.print_status).to eq "______\n You have 11 guesses left"
end