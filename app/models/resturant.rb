class Resturant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
