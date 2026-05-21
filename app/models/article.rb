class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true
end
