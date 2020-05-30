class User < ApplicationRecord
  has_secure_password
  belongs_to :company
  has_many :groups, through: :group_users
  has_many :group_users

  validates :name, presence: true
end
