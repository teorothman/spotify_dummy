class Album < ApplicationRecord
  include PgSearch::Model

  belongs_to :creator
  has_many :tracks, dependent: :destroy

  validates :name, uniqueness: { scope: :creator_id }
  validates :name, presence: true

  pg_search_scope :search_by_creator, associated_against: { creator: [:name] }

end
