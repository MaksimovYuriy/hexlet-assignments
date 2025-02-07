class Task < ApplicationRecord
  validates :name, :creator, presence: true
end
