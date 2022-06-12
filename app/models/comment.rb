class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: {maximum: 140}



  after_create_commit -> { broadcast_append_to :comments }
  # TODO: make above work
  # TODO: add after update commit


  # TODO: after_create -> notify admins
end
