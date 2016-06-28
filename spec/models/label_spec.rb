# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
include RandomData


RSpec.describe Label, type: :model do
<<<<<<< HEAD
  before do
    @topic = create :topic
    @user = create :user
    @post = create :post
    @label = create :label
  end
=======
   let(:topic) { create(:topic) }
   let(:user) { create(:user) }
   let(:post) { create(:post) }
   let(:label) { create(:label) }

  it { is_expected.to have_many :labelings }
>>>>>>> fedacbc646599728313cea0423e1c345a7bb5bc3

  describe "associations" do
    it { is_expected.to have_many :labelings }
    it { is_expected.to have_many(:topics).through(:labelings) }
    it { is_expected.to have_many(:posts).through(:labelings) }
  end

  describe "labelings" do
    it "allows the same label to be associated with a different topic and post" do
      topic.labels << label
      post.labels << label

      topic_label = topic.labels[0]
      post_label = post.labels[0]

      expect(topic_label).to eq(post_label)
    end
  end

  describe ".update_labels" do
    it "takes a comma delimeited string and returns an array of Labels" do
      labels = "#{label.name}"
      labels_as_a = [label]

      expect(Label.update_labels(labels)).to eq(labels_as_a)
    end
  end
end
