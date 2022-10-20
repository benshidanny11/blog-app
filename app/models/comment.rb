class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :comments_counter
  after_save :increment_counter

  private

  def increment_counter
    current_post = Post.find(post_id)
    current_post.update(comments_counter: (current_post.comments_counter || 0) + 1)
  end
end
