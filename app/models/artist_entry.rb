class ArtistEntry < ApplicationRecord
  validates :name, presence: true, length: { maximum: 200 }
  validates :body, presence: true

  scope :ordered, -> { order(position: :asc, created_at: :asc) }
end
