require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'attributes' do
    it { expect(subject.attributes).to include('title', 'content', 'author_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:author_id) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_length_of(:title).is_at_least(3).on(:create) }
    it { should validate_length_of(:title).is_at_most(80).on(:create) }
    it { should validate_length_of(:content).is_at_least(10).on(:create) }
    it { should validate_length_of(:content).is_at_most(500).on(:create) }
  end

  describe 'scopes' do
    let(:post1) { create(:post) }
    let(:post2) { create(:post, title: 'new title', created_at: 41.minutes.ago) }

    it 'should have old scope' do
      expect(Post.old).to include(post1)
      expect(Post.old).not_to include(post2)
    end
  end

  describe 'relations' do
    it { have_many(:comments) }
  end

  describe 'callbacks' do
    let(:author) { create(:author) }
    let(:post) { create(:post) }

    it 'should delete all associated comments' do
      Comment.create(content: 'x'*50, author_id: author.id, post_id: post.id)
      expect{post.destroy}.to change{ Comment.count }.by(-1)
    end
  end

end
