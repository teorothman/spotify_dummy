class Creator < ApplicationRecord
  belongs_to :user
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums

  validates :user, uniqueness: true
end
