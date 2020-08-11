require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @suggestion = params[:suggestion]

    url = "https://wagon-dictionary.herokuapp.com/#{@suggestion}"
    word_serialized = open(url)
    word = JSON.parse(word_serialized.read)
  end
end
