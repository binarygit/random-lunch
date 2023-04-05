class Lunch < ApplicationRecord
  belongs_to :resturant
  has_many :lunch_appointments
  has_many :lunch_participants, through: :lunch_appointments

  validates_associated :resturant

  validates :lunch_date, presence: true

  def self.upcoming
    find_by("lunch_date >= ?", Date.today)
  end

  def today?
    lunch_date == Date.today
  end

  def upcoming?
    self == Lunch.upcoming
  end
end
