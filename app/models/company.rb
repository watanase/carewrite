class Company < ApplicationRecord
  has_secure_password

  validates :name, presence: true
end
