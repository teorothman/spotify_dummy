class Creator < ApplicationRecord
  belongs_to :user
  has_many :albums
  has_many :tracks, through: :albums
end
