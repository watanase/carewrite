class Opinion < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :content, presence: true
end
