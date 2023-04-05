class Employee < ApplicationRecord
  has_many :lunch_appointments, foreign_key: :lunch_participant_id
  has_many :lunches, through: :lunch_appointments

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true

  def displayable_attributes
    non_displayable_attributes = ['id', 'created_at', 'updated_at', 'password_digest']
    self.attributes.except(*non_displayable_attributes)
  end
end
