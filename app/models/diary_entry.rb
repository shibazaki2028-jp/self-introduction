class DiaryEntry < ApplicationRecord
  validates :body, presence: true
  validates :entry_date, presence: true
end
