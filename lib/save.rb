module Save
  def save_game
    Dir.mkdir 'saved_games' unless Dir.exist? 'saved_games'
    save_file = File.new("saved_games/#{Random.new.rand()}.txt", "w")
    puts 'Game saved! Enter a letter to continue:'
  end
end
