require_relative 'display'
require_relative 'save'

class Game
  include Display, Save
  attr_accessor :answer, :guess, :attempts

  def initialize
    @answer = get_word
    @guess = []
    @attempts = 10

    until @attempts.zero? || won?
      game_loop
    end
    if won?
      you_win
    else
      you_lose
    end
  end

  private

  # Main game loop.
  def game_loop
    system "clear"
    art_select
    show_progress

    prompt_input
    input = gets.downcase.chomp
    if input == 'save'
      save_game
      input = gets.downcase.chomp
    end
    until valid_input?(input)
      invalid_input
      input = gets.downcase.chomp
    end

    unless @guess.include?(input)
      @guess.push(input)
      unless @answer.include?(input)
        @attempts -= 1
      end
    end
  end

  # Checks if all letters of answer have been checked.
  def won?
    @answer.split('').all? { |letter| @guess.include?(letter) }
  end

  # Selects random 5-12 char, non-proper noun word from .txt dictionary.
  def get_word
    word_list = File.open('5desk.txt', 'r').readlines
    
    word = ''
    until word.length.between?(5, 12) && word == word.downcase
      word = word_list[Random.new.rand(word_list.length)].chomp
    end
    word
  end

  # Checks to make sure guesses are a single a-z char.
  def valid_input?(input)
    input.match(/[a-z]/) && input.length == 1
  end
end
