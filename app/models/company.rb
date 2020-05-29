class Company < ApplicationRecord
  has_secure_password
  has_many :users
  has_many :recorders

  validates :name, presence: true
end
