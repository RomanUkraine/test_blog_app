class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  acts_as_voter

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, length: {maximum: 50}, uniqueness: true
  validates_presence_of :first_name, :last_name
  validates :admin, inclusion: [true, false]

  # TODO: add conditional callback - send notification if profile not complete


  def full_name
    "#{first_name} #{last_name}"
  end
end
