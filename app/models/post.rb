class Post < ApplicationRecord
  TITLE_MAX_CHARS = 50
  BODY_MAX_CHARS = 300

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: TITLE_MAX_CHARS }
  validates :body, presence: true, length: { maximum: BODY_MAX_CHARS }

  before_validation :strip_inputs

  after_create_commit { broadcast_prepend_to :posts }
  # TODO: change to after update

  # TODO: add popular scope (sorted by likes), recent, oldest

  private

  def strip_inputs
    # TODO check only for title and body
    self.attributes.each do |key, value|
      self[key] = value.strip.gsub(/ +/, ' ') if value.respond_to?("strip")
    end
  end
end
