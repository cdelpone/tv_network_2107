require 'spec_helper'

RSpec.describe Show do
  it 'exists with attributes' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    expect(knight_rider).to be_a Show
    expect(knight_rider.name).to eq("Knight Rider")
    expect(knight_rider.creator).to eq("Glen Larson")
    expect(knight_rider.characters).to eq([michael_knight, kitt])
  end

  it 'calcs total salary' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    expect(knight_rider.total_salary).to eq(2600000)
  end

  it 'calcs the highest paid actor' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    expect(knight_rider.highest_paid_actor).to eq("David Hasselhoff")
  end

  it 'lists the actors' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    expect(knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])
  end
end
