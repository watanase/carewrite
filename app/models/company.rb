class Company < ApplicationRecord
  has_secure_password
  has_many :post_readers

  validates :name, presence: true
end
