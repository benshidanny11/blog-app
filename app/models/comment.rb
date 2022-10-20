class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :increment_counter

  private

  def increment_counter
    current_post = Post.find(post_id)
    current_post.update(comments_counter: (current_post.comments_counter || 0) + 1)
  end
end
