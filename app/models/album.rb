class Album < ApplicationRecord
  include PgSearch::Model

  belongs_to :creator
  has_many :tracks, dependent: :destroy

  pg_search_scope :search_by_creator, associated_against: { creator: [:name] }

end
