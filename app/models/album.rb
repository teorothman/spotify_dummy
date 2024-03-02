class Album < ApplicationRecord
  belongs_to :creator
  has_many :tracks, dependent: :destroy
end
