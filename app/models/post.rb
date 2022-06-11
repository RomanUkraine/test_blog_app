class Post < ApplicationRecord
  validates_presence_of :body, :title

  belongs_to :user
  has_many :comments, dependent: :destroy

  after_create_commit { broadcast_prepend_to :posts }

  # TODO: add popular scope (sorted by likes)
  # TODO: add likes
end
