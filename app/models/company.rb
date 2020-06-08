class Company < ApplicationRecord
  has_secure_password
  has_many :users
  has_many :recorders
  has_many :groups

  validates :name, presence: true
end
