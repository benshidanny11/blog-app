class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, counter_cache: :comments_counter
  after_save :increment_counter

  def increment_counter
    post.update(comments_counter: (post.comments_counter || 0) + 1)
  end
end
