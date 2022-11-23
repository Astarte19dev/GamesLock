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

Game.destroy_all

url = "https://api.geekdo.com/api/hotness"
games_serialized = URI.open(url).read
games = JSON.parse(games_serialized)

games["items"].each do |game|
  game_selection = Game.new(
    name: game["name"],
    description: game["description"]
  )
  game_selection.user = User.first
  file = URI.open(game["images"]["mediacard"]["src@2x"])
  game_selection.photo.attach(io: file, filename: 'image', content_type: 'image/png')
  game_selection.save!
  # puts "#{game_selection.name} - #{game_selection.description}"
end

resa1 = Reservation.create(date_start = 13052020, date_end = 15052020)
resa2 = Reservation.create(date_start = 13122022, date_end = 15122022)
resa3 = Reservation.create(date_start = 20122022, date_end = 22122022)
