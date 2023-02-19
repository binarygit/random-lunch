class Employee < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true

  def displayable_attributes
    non_displayable_attributes = ['id', 'created_at', 'updated_at', 'password_digest']
    displayable_attributes = self.attributes.reject do |key, value|
      key == non_displayable_attributes[0] || key == non_displayable_attributes[1] || key == non_displayable_attributes[2] || key == non_displayable_attributes[3]
    end
    return displayable_attributes
  end
end
