class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  attribute :likes_counter, :integer, default: 0

  after_save :update_likes_counter

  private

  def update_likes_counter
    @post.increment!(:likes_counter)
    puts 'likes_counter updated successfully'
  end
end
