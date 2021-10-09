require 'yaml'

module Save
  # Saves game to a file.
  def save_game
    Dir.mkdir 'saved_games' unless Dir.exist? 'saved_games'
    unless @filename
      @filename = "#{Random.new.rand(100000..999999)}.yaml"
    end
    File.open("saved_games/#{@filename}", "w") { |f| f.write to_yaml }

    puts 'Game saved! Enter a letter to continue:'
  end

  # Converts to YAML.
  def to_yaml
    YAML.dump(
      'filename' => @filename,
      'answer' => @answer,
      'guess' => @guess,
      'attempts' => @attempts
    )
  end

  # Converts from YAMl.
  def from_yaml
    @filename = file['filename']
    @answer = file['answer']
    @guess = file['guess']
    @attempts = file['attempts']
  end

  def save_select
  end

  # Loads game from file.
  def load_game
    available_saves = Dir.entries('saved_games').select {|f| File.file(f) }
  end
end
