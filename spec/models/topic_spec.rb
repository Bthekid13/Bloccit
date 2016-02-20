require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(name: "Topic name", description: "Yes you did.") }

  it { is_expected.to have_many(:posts) }

  # #1
  describe "attributes" do
    it "should respond to name" do
      expect(topic).to respond_to(:name)
    end

    it "should respond to description" do
      expect(topic).to respond_to(:description)
    end

    it "should respond to public" do
      expect(topic).to respond_to(:public)
    end

    # #2
    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
end
