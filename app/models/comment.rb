class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit -> { broadcast_append_to :comments }
  # TODO: add after destroy commit
  # TODO: add after update commit


  # TODO: add validations
end
