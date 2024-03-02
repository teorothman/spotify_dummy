class Track < ApplicationRecord
  include PgSearch::Model
  belongs_to :genre
  belongs_to :album
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks

  pg_search_scope :super_search,
                  against: [ :name ],
                  associated_against: {
                    genre: [:title],
                    album: [:name],
                  },
                  using: {
                    tsearch: { prefix: true }
  }
end
