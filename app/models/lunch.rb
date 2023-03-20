class Lunch < ApplicationRecord
  belongs_to :resturant
  validates_associated :resturant

  validates :lunch_date, presence: true
end
