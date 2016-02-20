require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) {Post.create!(title: "New post title", body: "New post body") }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:topic) }
  # 2
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_length_of(:body).is_at_least(20) }
  describe "attributes" do
    it "should respond to title" do
      expect(post).to respond_to(:title)
    end
    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
  end


end
