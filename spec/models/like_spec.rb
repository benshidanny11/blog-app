require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Test User')
  post = Post.new(user:, title: 'Hello', comments_counter: 0, likes_counter: 0, user_id: 1)
  like = Like.new(user:, post:, user_id: 1)
  subject { like }

  before { subject.save }

  context 'Call increment counter on a like' do
    it 'should increment the likes_counter of the Post' do
      previous_counter = post.likes_counter || 0
      like.increment_counter
      expect(post.likes_counter).to eql(previous_counter + 1)
    end
  end
end
