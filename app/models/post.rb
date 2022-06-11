class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :body, presence: true, length: {maximum: 140}


  after_create_commit { broadcast_prepend_to :posts }
  # TODO: change to after update

  # TODO: add popular scope (sorted by likes), recent, oldest
end
