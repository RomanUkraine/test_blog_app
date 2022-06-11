class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  has_many :posts
  has_many :comments

  validates :email, presence: true, length: {maximum: 50}, uniqueness: true
  validates_presence_of :first_name, :last_name
  validates :admin, inclusion: [true, false]


  def full_name
    "#{first_name} #{last_name}"
  end
end
