require 'spec_helper'

RSpec.describe Network do
  it 'exists with attributes' do
    nbc = Network.new("NBC")

    expect(nbc).to be_a Network
    expect(nbc.name).to eq("NBC")
    expect(nbc.shows).to eq([])
  end

  it 'has shows' do
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    expect(nbc.shows).to eq([knight_rider, parks_and_rec])
  end

  it 'has main characters' do
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    expect(nbc.main_characters).to eq([kitt])
  end

  it 'can list actors by show' do
    nbc = Network.new("NBC")
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    expect(nbc.actors_by_show).to eq({
      knight_rider => ["David Hasselhoff", "William Daniels"],
      parks_and_rec => ["Amy Poehler", "Nick Offerman"]
    })
  end
end


# Iteration 4
# Use TDD to update your Network class so that it responds to the following interaction pattern. An actor is considered prolific if they have been in more than one show for that network:
#
# nbc = Network.new("NBC")
# # => nbc
#
# michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
# # => michael_knight
#
# kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
# # => kitt
#
# knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
# # => knight_rider
#
# mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
# # => mitch
#
# baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])
# # => baywatch
#
# leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
# # => leslie_knope
#
# ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
# # => ron_swanson
#
# parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
# # => parks_and_rec
#
# parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
# # => parks_and_rec
#
# nbc.add_show(knight_rider)
#
# nbc.add_show(baywatch)
#
# nbc.add_show(parks_and_rec)
#
# nbc.shows_by_actor
# # => {
# #      "David Hasselhoff" => [knight_rider, baywatch],
# #      "William Daniels" => [knight_rider],
# #      "Amy Poehler" => [parks_and_rec],
# #      "Nick Offerman" => [parks_and_rec]
# #    }
#
# nbc.prolific_actors
# # => ["David Hasselhoff"]
