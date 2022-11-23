# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "#{games["items"][0]["name"]} - #{games["items"][0]["description"]} - #{games["items"][0]["images"]["square100"]["src"]} - #{games["items"][0]["images"]["mediacard"]["src@2x"]}"

require "json"
require "open-uri"

puts "cleaning games in db"

Game.destroy_all

puts "db cleaned !"

puts "call API"
url = "https://api.geekdo.com/api/hotness"
games_serialized = URI.open(url).read
games = JSON.parse(games_serialized)

puts "games creation"
games["items"].each do |game|
  game_selection = Game.new(
    name: game["name"],
    description: game["description"]
  )
  game_selection.user = User.all.sample
  file = URI.open(game["images"]["mediacard"]["src@2x"])
  game_selection.photo.attach(io: file, filename: 'image', content_type: 'image/png')
  game_selection.save!
  # puts "#{game_selection.name} - #{game_selection.description}"
end

puts "all is done !"
