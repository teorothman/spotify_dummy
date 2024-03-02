class Track < ApplicationRecord
  belongs_to :genre
  belongs_to :album
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks
end
