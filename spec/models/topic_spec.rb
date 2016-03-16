require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:labelings) }
  it { is_expected.to have_many(:labels).through(:labelings) }
  it { should have_many(:posts) }

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

    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
<<<<<<< HEAD

  describe "scopes" do
    before do
      # #1
=======
  describe "scopes" do
    before do
>>>>>>> xm_46_checkpoint_private
      @public_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
      @private_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph, public: false)
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = User.new
        # #2
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end

      it "returns only public topics if user is nil" do
        # #3
        expect(Topic.visible_to(nil)).to eq([@public_topic])
      end
    end
<<<<<<< HEAD
    describe "publically_viewable" do
      it "returns only public topics" do
        user = User.new
        expect(Topic.publically_viewable).to eq(@public_topic)
      end
    end

    describe "publically_viewable" do
      it "returns only private topics" do
        user = User.new
        expect(Topic.privately_viewable).to eq(@private_topic)
      end
    end
=======
>>>>>>> xm_46_checkpoint_private
  end
end
