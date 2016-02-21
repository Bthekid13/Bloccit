require 'rails_helper'

RSpec.describe Label, type: :model do
   let(:topic) { build(:topic) }
   let(:user) { build(:user) }
   let(:post) { build(:post) }
   let(:label) { Label.create!(name: 'Label') }


  it { is_expected.to have_many :labelings }

  it { is_expected.to have_many(:topics).through(:labelings) }
  it { is_expected.to have_many(:posts).through(:labelings) }

  describe "labelings" do
    it "allows the same label to be associated with a different topic and post" do
      topic.label << label
      post.label << label

      topic_label = topic.labels[0]
      post_label = post.labels[0]

      expect(topic_label).to eq(post_label)
    end
  end

  describe ".update_labels" do
    it "takes a comma delimeited string and returns an array of Labels" do
      labels = "#{label.name}, #{label2.name}"
      labels_as_a = [label, label2]
    end
  end

end
