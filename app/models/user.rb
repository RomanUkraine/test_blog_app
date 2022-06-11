class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  has_many :posts
  has_many :comments

  def full_name
    "#{first_name} #{last_name}"
  end


  # TODO: add validations
  # TODO: add callback to set last_seen_at
end
