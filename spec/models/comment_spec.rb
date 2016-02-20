require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:my_user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }


  describe "attributes" do
    it "responds to body" do
    expect(comment).to respond_to(:body)
    end
  end

end
