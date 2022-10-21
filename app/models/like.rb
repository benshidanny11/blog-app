class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter
  after_save :increment_counter

  def increment_counter
    post.update(likes_counter: (post.likes_counter || 0) + 1)
  end
end
