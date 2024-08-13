# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Song.delete_all

# Create some sample songs
songs = [
  { title: 'Song One', artist: 'Artist A', album: 'Album A', released_on: '2024-01-01' },
  { title: 'Song Two', artist: 'Artist B', album: 'Album B', released_on: '2024-02-01' },
  { title: 'Song Three', artist: 'Artist C', album: 'Album C', released_on: '2024-03-01' }
]

songs.each do |song_attributes|
  Song.create!(song_attributes)
end
