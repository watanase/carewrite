class Post < ApplicationRecord
  default_scope { order(datetime: :asc) }
  belongs_to :user
  belongs_to :recorder

  validates :focus, presence: true
  validates :content, presence: true
end
