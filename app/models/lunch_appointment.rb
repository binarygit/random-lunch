class LunchAppointment < ApplicationRecord
  belongs_to :lunch
  belongs_to :lunch_participant, class_name: "Employee"
end
