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

puts "loading in fencers 🤺..."

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

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/W/WEN_yiwei%20eason_1647.jpg")
fencer5 = Fencer.new(name: "Eason Wen", points: 0)
fencer5.photo.attach(io: file, filename: "wen-eason.png", content_type: "image/png")
fencer5.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/S/SUMMERFIELD_simon_270.jpg")
fencer6 = Fencer.new(name: "Simon Summerfield", points: 0)
fencer6.photo.attach(io: file, filename: "summerfield-simon.png", content_type: "image/png")
fencer6.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/O/OHRT_jacob_1635.jpg")
fencer7 = Fencer.new(name: "Jacob Ohrt", points: 0)
fencer7.photo.attach(io: file, filename: "ohrt-jacob.png", content_type: "image/png")
fencer7.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/M/MORANDINI_adriano_2138.jpg")
fencer8 = Fencer.new(name: "Adrianno Morandini", points: 0)
fencer8.photo.attach(io: file, filename: "morandini-adrianno.png", content_type: "image/png")
fencer8.save!

file = URI.open("https://www.ausfencing.org/wp-content/uploads/Bios/H/HAYES_isaac_823.jpg")
fencer9 = Fencer.new(name: "Isaac Hayes", points: 0)
fencer9.photo.attach(io: file, filename: "hayes-isaac.png", content_type: "image/png")
fencer9.save!