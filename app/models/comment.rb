class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # TODO: add validations
end
