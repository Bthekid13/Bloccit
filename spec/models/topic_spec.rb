# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string
#  public      :boolean          default(TRUE)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Topic, type: :model do

  @topic = Topic.create!(name: "Yo dog.", description: "A dog saying yo.", public: true)

  describe "attributes" do
    it { should have_db_column(:name).of_type(:string)}
    it { should have_db_column(:description).of_type(:text)}
    it { should have_db_column(:public).of_type(:boolean).with_options({default: true}) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:labelings)}
    it { is_expected.to have_many(:labels).through(:labelings)}
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:name).is_at_least(5)}
    it { is_expected.to validate_length_of(:description).is_at_least(10)}
  end

  describe "scopes" do
    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = User.new
        expect(Topic.visible_to(user)).to eq(Topic.all)
      end

      it "returns only public topics if user is nil" do
        expect(Topic.visible_to(nil)).to eq(Topic.visible_to(nil))
      end
    end
  end
end
