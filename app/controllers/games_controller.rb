require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    if @word ==
      @answer = "Sorry but #{@word} can't be built out of #{@letters}"
    elsif @word ==
      @answer = "Sorry but #{@word} does not seem to be a valid English word..."
    else
      @answer = "Congratulations! #{@word} is a valid English word!"
    end
  end
end

def generate_grid(grid_size)
  Array.new(grid_size) { ('A'..'Z').to_a.sample }
end

def included?(guess, grid)
  guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
end
def english_word?(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']
end
