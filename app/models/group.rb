class Group < ApplicationRecord
  belongs_to :company
  has_many :users, dependent: :nullify

  validates :name, presence: true
end
