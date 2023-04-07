require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'The number of likes will increased by one ' do
    first_user = User.new(name: 'eddy', bio: 'this is my bio', postsCounter: 4)
    first_user.save

    my_post = Post.new(title: 'first post', text: 'post text', comments_counter: 6, likes_counter: 10,
                       author_id: first_user.id)
    my_post.save

    like = Like.new(author: first_user, post: my_post)
    like.save

    expect(like.post.likes_counter).to eql(11)
  end
end
