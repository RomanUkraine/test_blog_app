class Comment < ApplicationRecord
  MAX_CHARS = 400

  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: { maximum: MAX_CHARS }

  after_create_commit -> { broadcast_append_to :comments }
  # TODO: make above work
  # TODO: add after update commit


  # TODO: after_create -> notify admins
end
