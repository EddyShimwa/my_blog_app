class UserSerializer < ActiveModel::Serializer
  attributes :id, :photo, :bio, :posts_counter, :email, :name
  has_many :posts
end
