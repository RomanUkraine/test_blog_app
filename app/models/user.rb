class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  has_many :posts

  # TODO: add validations
  # TODO: add callback to set last_seen_at
end
