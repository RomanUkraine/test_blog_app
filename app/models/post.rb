class Post < ApplicationRecord
  validates_presence_of :body, :title

  after_create_commit { broadcast_prepend_to :posts }
end
