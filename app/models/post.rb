class Post < ApplicationRecord
  TITLE_MAX_CHARS = 50
  BODY_MAX_CHARS = 300

  acts_as_votable

  has_one_attached :image
  # TODO: add gem 'activestorage-validator'

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: TITLE_MAX_CHARS }
  validates :body, presence: true, length: { maximum: BODY_MAX_CHARS }

  before_validation :strip_inputs

  after_create_commit -> { broadcast_prepend_later_to :posts, locals: { user: :current_user, post: self } }
  # TODO: add after update

  # TODO: add popular scope (sorted by likes), recent, oldest

  def self.search(params)
    query = "%#{sanitize_sql_like(params[:query])}%" if params[:query]
    params[:query].blank? ? all : where("title LIKE ? OR body LIKE ?", query, query)
  end

  private

  def strip_inputs
    # TODO check only for title and body
    self.attributes.each do |key, value|
      self[key] = value.strip.gsub(/ +/, ' ') if value.respond_to?("strip")
    end
  end
end
