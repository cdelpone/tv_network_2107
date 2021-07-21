class Network

  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
    @group_actors = Hash.new { |hash, key| hash[key] = []}
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @all_characters = @shows.flat_map do |show|
      show.characters
    end
    @all_characters.find_all do |character|
      character.salary > 500_000 && character.name == character.name.upcase
    end
  end

  def actors_by_show
    @shows.each do |show|
      show.characters.each do |character|
      @group_actors[show] << character.actor
    end
  end
  @group_actors
  end
end
