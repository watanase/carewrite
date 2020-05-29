class Recorder < ApplicationRecord
  has_secure_password
  belongs_to :company

  validates :name, presence: true
end
