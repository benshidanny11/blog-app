class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter
  after_save :increment_counter

  private

  def increment_counter
    current_post = Post.find(post_id)
    current_post.update(likes_counter: (current_post.likes_counter || 0) + 1)
  end
end
