# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :integer
#  auth_token      :string
#

require 'rails_helper'
include RandomData

include SessionsHelper

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "attributes" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:role).of_type(:integer).with_options({null: false, default: 0}) }
    it { should define_enum_for(:role) }
  end

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
  end

  describe 'validations' do
    #password
    it { is_expected.to validate_presence_of(:password)}
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6)}
    #email
    it { is_expected.to validate_length_of(:email).is_at_least(3)}
    it { is_expected.to allow_value("user@bloccit.com").for(:email)}
    it { is_expected.to validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email).case_insensitive }
    #name
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_length_of(:name).is_at_least(1)}
    #role
    it { is_expected.to validate_presence_of(:role)}
  end

  describe "#favorite_for(post)" do
    before do
      @user = User.create!(email: 'admin@example.com', name: 'admin', password: 'helloworld')
      @topic = Topic.create!(name: "Topic of discussion", description: "This has to be a little longer but not too long.")
      @post = Post.create!(title: "A Post for all ages", body: "Texty Texting Textily", user: @user, topic: @topic)
    end

    it "returns nil if user has not fovrited the post" do
      expect(@user.favorite_for(@post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect(@user.favorite_for(@post)).to eq(favorite)
    end
  end

  describe ".avatar_url" do
    let(:know_user) { create(:user, email: "blochead@bloc.io")}

    it "returns the proper Gravatar url for a known email entity" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
      expect(know_user.avatar_url(48)).to eq(expected_gravatar)
    end
  end

  describe "#generate_auth_token" do
    it "creates a token" do
      @user = create :user
      expect(@user.auth_token).to_not be_nil
    end
  end
end
