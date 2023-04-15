require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'The number of comments will increased by one ' do
    first_user = User.new(name: 'hassan', bio: 'This is my bio', posts_counter: 4)
    first_user.save

    my_post = Post.new(title: 'post title', text: 'post text', comments_counter: 6, likes_counter: 10,
                       author_id: first_user.id)
    my_post.save

    my_comment = Comment.new(post: my_post, author: first_user, text: 'Hi comments!')

    my_comment.save

    expect(my_comment.post.comments_counter).to eql(6)
  end
end
