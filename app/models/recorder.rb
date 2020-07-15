class Recorder < ApplicationRecord
  has_secure_password
  belongs_to :company
  has_many :post, dependent: :nullify

  validates :name, presence: true
  validates :login_id, uniqueness: true
end
