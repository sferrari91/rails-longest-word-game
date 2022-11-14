require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  @letters = alphabet.shuffle[0..9].join(' ').upcase
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = URI.open(url).read
    dictionary = JSON.parse(user_serialized)

  new_letter = @letters.split()
  new_word = @word.split("")


  def word_include
    new_word.each do |letter|
    if new_letter.include? letter
      return true
    end
  end

    if dictionary["found"] = true && word_include
    @result = "The word is valid according to the grid and is an English word"
    elsif dictionary["found"] = true && !word_include
    @result = "The word can’t be built out of the original grid"
    else
    @result = "The word is valid according to the grid and is an English word"
    end

end

end
end
