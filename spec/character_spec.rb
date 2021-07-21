require 'spec_helper'

RSpec.describe Character do
  it 'exists and has attributes' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})

    expect(kitt).to be_a Character
    expect(kitt.name).to eq("KITT")
    expect(kitt.actor).to eq("William Daniels")
    expect(kitt.salary).to eq(1000000)
  end
end


# Iteration 2
#
# kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
# # => kitt
#
# michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
# # => michael_knight
#
# knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
# # => knight_rider
#
# expect(knight_rider.name).to eq("Knight Rider")
#
# expect(knight_rider.creator).to eq("Glen Larson")
#
# expect(knight_rider.characters).to eq([michael_knight, #<Character:0x00007f8326ab57d8...>])
#
# expect(knight_rider.total_salary).to eq(2600000)
#
# expect(knight_rider.highest_paid_actor).to eq("David Hasselhoff")
#
# expect(knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])
