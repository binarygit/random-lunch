class Lunch < ApplicationRecord
  belongs_to :resturant
  validates_associated :resturant

  validates :lunch_date, presence: true

  scope :upcoming, -> { find_by("lunch_date >= ?", Date.today) }

  def today?
    lunch_date == Date.today
  end

  def upcoming?
    self == Lunch.upcoming
  end
end
