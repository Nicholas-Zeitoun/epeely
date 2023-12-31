# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

file = URI.open("https://res.cloudinary.com/dnfz8nhuf/image/upload/v1703807224/s0vgzb0cndbpd2knh2v3.jpg")
fencer = Fencer.new(name: "Nicholas Zeitoun", points: 0)
fencer.photo.attach(io: file, filename: "nicholas-zeitoun.png", content_type: "image/png")
fencer.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/E/ENGLISH_alexander_1116.jpg")
fencer1 = Fencer.new(name: "Alexander English", points: 0)
fencer1.photo.attach(io: file, filename: "alexander-english.png", content_type: "image/png")
fencer1.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/Y/YATES_domenic_1131.jpg")
fencer2 = Fencer.new(name: "Domenic Yates", points: 0)
fencer2.photo.attach(io: file, filename: "domenic-yates.png", content_type: "image/png")
fencer2.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/M/MCCLELLAND_darcy_2468.jpg")
fencer3 = Fencer.new(name: "Darcy Mccelland", points: 0)
fencer3.photo.attach(io: file, filename: "nicholas-zeitoun.png", content_type: "image/png")
fencer3.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/H/HILL_alister_2629.jpg")
fencer4 = Fencer.new(name: "Alister Hill", points: 0)
fencer4.photo.attach(io: file, filename: "alister-hill.png", content_type: "image/png")
fencer4.save!