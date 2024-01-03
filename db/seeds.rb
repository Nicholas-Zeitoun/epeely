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

puts "deleting tournaments 😭"
Tournament.destroy_all
puts "deleting fencers 😬"
Fencer.destroy_all
puts "loading in fencers 🤺..."


path = File.join(File.dirname(__FILE__), "./fencers.json")
json_data = JSON.parse(File.read(path))

json_data["fencers"].each do |fencer|
    puts "adding #{fencer["name"]}!"
    file = URI.open(fencer["file_url"])
    new_fencer = Fencer.new(name: fencer["name"], points: fencer["points"])
    new_fencer.photo.attach(io: file, filename: fencer["image_name"], content_type: "image/png")
    new_fencer.save!
end

puts "Fencers are seeded! 🎉"

