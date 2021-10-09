require 'yaml'

module Save
  # Saves game to a file.
  def save_game
    Dir.mkdir 'saved_games' unless Dir.exist? 'saved_games'
    prompt_slot unless @save_slot
    File.open("saved_games/#{@save_slot}.yaml", "w") { |f| f.write to_yaml }

    puts 'Game saved! See you soon!'
    exit
  end

  # Converts to YAML.
  def to_yaml
    YAML.dump(
      'save_slot' => @save_slot,
      'answer' => @answer,
      'guess' => @guess,
      'attempts' => @attempts
    )
  end

  # Converts from YAMl.
  def from_yaml
    file = YAML.safe_load(File.read("saved_games/#{@save_slot}.yaml"))
    @save_slot = file['save_slot']
    @answer = file['answer']
    @guess = file['guess']
    @attempts = file['attempts']
  end

  # Choose save slot for the game.
  def prompt_slot
    display_saves
    input = gets.chomp.to_i
    until input.between?(0,4)
      puts "Invalid entry, select a save slot (\033[31m0-4\033[0m):"
      input = gets.chomp.to_i
    end
    @save_slot = input
  end

  # Shows state of all save slots.
  def display_saves
    puts "Select a save slot (\033[31m0-4\033[0m):"
  end

  # Loads game from file.
  def load_game
    prompt_slot
    from_yaml
  end
end
