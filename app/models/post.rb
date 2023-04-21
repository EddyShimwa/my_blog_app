class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_destroy :update_post_counter

  private

  def update_post_counter
    author.update(posts_counter: author.posts.all.count)
  end
end
