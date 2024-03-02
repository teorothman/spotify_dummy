# db/seeds.rb

# Clear existing data
User.destroy_all
Creator.destroy_all
Genre.destroy_all
Album.destroy_all
Track.destroy_all
Playlist.destroy_all
PlaylistTrack.destroy_all

# Users
users = User.create!([
  { email: 'user1@example.com', password: 'password1', password_confirmation: 'password1' },
  { email: 'user2@example.com', password: 'password2', password_confirmation: 'password2' }
])

# Creators
creators = Creator.create!([
  { name: 'Creator One', user: users.first },
  { name: 'Creator Two', user: users.last }
])

# Genres
genres = Genre.create!([
  { title: 'Rock', description: 'A genre of popular music that originated as "rock and roll" in the United States in the late 1940s and early 1950s.' },
  { title: 'Pop', description: 'A genre of popular music that originated in its modern form during the mid-1950s in the United States and the United Kingdom.' }
])

# Albums
albums = Album.create!([
  { name: 'Album One', description: 'The first album by Creator One', creator: creators.first },
  { name: 'Album Two', description: 'The second album by Creator Two', creator: creators.last }
])

# Tracks
tracks = Track.create!([
  { name: 'Track One', genre: genres.first, album: albums.first },
  { name: 'Track Two', genre: genres.last, album: albums.last }
])

# Playlists
playlists = Playlist.create!([
  { name: 'Playlist One', description: 'A collection of rock tracks.', user: users.first },
  { name: 'Playlist Two', description: 'A collection of pop tracks.', user: users.last }
])

# PlaylistTracks
PlaylistTrack.create!([
  { track: tracks.first, playlist: playlists.first },
  { track: tracks.last, playlist: playlists.last }
])

puts 'Seed data successfully loaded!'
