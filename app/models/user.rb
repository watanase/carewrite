class User < ApplicationRecord
  has_secure_password
  belongs_to :company
  belongs_to :user
  validates :name, presence: true

end
