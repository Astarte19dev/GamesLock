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

User.destroy_all

mathieu = User.create!(firstname: "Mathieu", lastname: "Dupont", address: "48 rue ducau", city: "Bordeaux", email: "mathieu@mail.com", password: "azerty")
georges = User.create!(firstname: "Georges", lastname: "Duncan", address: "2 rue Jacques Juillac", city: "Talence", email: "georges@mail.com", password: "azerty")

puts "db cleaned !"

puts "call API"
url = "https://api.geekdo.com/api/hotness"
games_serialized = URI.open(url).read
games = JSON.parse(games_serialized)

puts "games creation"
games["items"].each do |game|
  game_selection = Game.new(
    name: game["name"],
    description: game["description"],
    game_type: Game::GAME_TYPE.sample,
    level: Game::LEVEL.sample,
    player: rand(1..8),
    age: rand(1..16),
    price: rand(1..10)
  )
  game_selection.user = [mathieu, georges].sample
  file = URI.open(game["images"]["mediacard"]["src@2x"])
  game_selection.photo.attach(io: file, filename: 'image', content_type: 'image/png')
  file = URI.open(game["images"]["square100"]["src@2x"])
  game_selection.thumb.attach(io: file, filename: 'image', content_type: 'image/png')
  file = URI.open(game["images"]["square100"]["src"])
  game_selection.mini_thumb.attach(io: file, filename: 'image', content_type: 'image/png')
  game_selection.save!
  # puts "#{game_selection.name} - #{game_selection.description}"
end

puts "all is done !"
