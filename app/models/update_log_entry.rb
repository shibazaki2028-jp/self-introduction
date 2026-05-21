class UpdateLogEntry < ApplicationRecord
  validates :log_date, presence: true
  validates :body, presence: true
end
