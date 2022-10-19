class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_posts_counter

  def recent_comments
    comments.last(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
