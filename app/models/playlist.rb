class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tracks, through: :playlist_tracks
  has_many :playlist_tracks
end
