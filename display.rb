module Display

  # Shows title card and load/new game menu.
  def main_menu
    puts <<-HEREDOC
              **************************
              *** WELCOME TO HANGMAN ***
              **************************

Enter \033[31mL\033[0m to load a saved game or anything else to continue.
HEREDOC
  end

  # Chooses correct ASCII art for # of attempts left.
  def art_select
    send("stage#{@attempts}")
  end

  # Formats and displays the current state of the game.
  def show_progress
    guesses_left
    show_answer
    show_guess    
  end

  def prompt_input
    puts "Guess a letter or type \033[31msave\033[0m to save and quit:"
  end

  def invalid_input
    puts 'Invalid input.  Enter a single letter guess. Try again:'
  end

  def you_win
    puts "Congratulations! You correctly guessed \033[31m#{@answer}\033[0m!"
  end

  def you_lose
    system "clear"
    stage0
    puts "You lose! The answer was \033[31m#{@answer}\033[0m."
  end

  def guesses_left
    if @attempts == 1
      puts "You have \033[32mone\033[0m guess remaining! Do or die!"
    else
      puts "You have \033[32m#{@attempts}\033[0m guesses remaining."
    end
  end

  def show_answer
    print 'Secret word: '
    @answer.split('').each do |letter|
      if @guess.include?(letter)
        print "#{letter} "
      else
        print '_ '
      end
    end
    print "\n"
  end

  def show_guess
    print 'Your guesses: '
    @guess.each do |letter|
      if @answer.include?(letter)
        print "\033[32m#{letter}\033[0m "
      else
        print "#{letter} "
      end
    end
    print "\n\n"
  end

  def stage10
    puts <<-DRAWING
  .___.
  |
  |
  |
  |
  |
  |
  --------
  DRAWING
  end

  def stage9
    puts <<-DRAWING
  .___.
  |   |
  |
  |
  |
  |
  |
  --------
  DRAWING
  end

  def stage8
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |
  |
  |
  |
  --------
  DRAWING
  end

  def stage7
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |   |
  |
  |
  |
  --------
  DRAWING
  end

  def stage6
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |  /|
  |
  |
  |
  --------
  DRAWING
  end

  def stage5
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |  /|\\
  |
  |
  |
  --------
  DRAWING
  end

  def stage4
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |  /|\\
  |   |
  |
  |
  --------
  DRAWING
  end

  def stage3
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |  /|\\
  |   |
  |  /
  |
  --------
  DRAWING
  end

  def stage2
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |  /|\\
  |   |
  |  / \\
  |
  --------
  DRAWING
  end

  def stage1
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |  /|\\
  |   |
  | _/ \\
  |
  --------
  DRAWING
    end

  def stage0
    puts <<-DRAWING
  .___.
  |   |
  |   0
  |  /|\\
  |   |
  | _/ \\_
  |
  --------
  DRAWING
  end
end
