class Company < ApplicationRecord
  has_secure_password
  has_many :users, dependent: :destroy
  has_many :recorders, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true
end
