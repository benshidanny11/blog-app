class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', counter_cache: :posts_counter
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_save :increment_counter

  def increment_counter
    user.update(posts_counter: (user.posts_counter || 0) + 1)
  end

  def recent_comments(count: 5)
    comments.order(created_at: :desc)[0, count]
  end
end
