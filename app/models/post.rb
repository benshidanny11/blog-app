class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :increment_counter

  private

  def increment_counter
    current_user = User.find(user_id)
    current_user.update(posts_counter: (current_user.posts_counter || 0) + 1)
  end

  def recent_comments(count: 5)
    Comment.where(post_id: id).order(created_at: :desc)[0, count]
  end
end
