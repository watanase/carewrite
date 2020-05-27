class Company < ApplicationRecord
  has_secure_password
  has_many :users

  validates :name, presence: true
end
