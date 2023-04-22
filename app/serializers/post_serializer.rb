class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :comments_counter, :text
  belongs_to :author
  has_many :comments
end
