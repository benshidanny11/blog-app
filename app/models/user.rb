class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  def recent_posts(count: 3)
    Post.where(user_id: id).order(created_at: :desc)[0, count]
  end
end
