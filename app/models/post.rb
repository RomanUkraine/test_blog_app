class Post < ApplicationRecord
  validates_presence_of :body, :title

  belongs_to :user

  after_create_commit { broadcast_prepend_to :posts }
end
