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
<<<<<<< HEAD
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
=======
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "responds to role" do
      expect(user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "responds to member?" do
      expect(user).to respond_to(:member?)
    end
  end

  describe "roles" do
    it "is member by default" do
      expect(user.role).to eql("member")
    end

    context "member user" do
      it "returns true for #member?" do
        expect(user.member?).to be_truthy
      end
>>>>>>> fedacbc646599728313cea0423e1c345a7bb5bc3

  describe "#favorite_for(post)" do
    before do
      @user = User.create!(email: 'admin@example.com', name: 'admin', password: 'helloworld')
      @topic = Topic.create!(name: "Topic of discussion", description: "This has to be a little longer but not too long.")
      @post = Post.create!(title: "A Post for all ages", body: "Texty Texting Textily", user: @user, topic: @topic)
    end

<<<<<<< HEAD
    it "returns nil if user has not fovrited the post" do
      expect(@user.favorite_for(@post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect(@user.favorite_for(@post)).to eq(favorite)
=======
    context "admin user" do
      before do
        user.admin!
      end

      it "returns false for #member?" do
        expect(user.member?).to be_falsey
      end

      it "returns true for #admin?" do
        expect(user.admin?).to be_truthy
      end
    end

    describe "#favorite_for(post)" do
      before do
        topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
        @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
      end

      it "returns `nil` if the user has not favorited the post" do
        expect(user.favorite_for(@post)).to be_nil
      end

      it "returns the appropriate favorite if it exists" do
        favorite = user.favorites.where(post: @post).create
        expect(user.favorite_for(@post)).to eq(favorite)
      end
>>>>>>> fedacbc646599728313cea0423e1c345a7bb5bc3
    end
  end

  describe ".avatar_url" do
    let(:know_user) { create(:user, email: "blochead@bloc.io")}

    it "returns the proper Gravatar url for a known email entity" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
      expect(know_user.avatar_url(48)).to eq(expected_gravatar)
    end
  end

<<<<<<< HEAD
  describe "#generate_auth_token" do
    it "creates a token" do
      @user = create :user
      expect(@user.auth_token).to_not be_nil
=======
  describe ".avatar_url" do
    let(:known_user) {build(:user, email: "blochead@gmail.com")}
    it "returns the proper Gravatar url for a known email entity" do
      expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"

      it "returns the proper Gravatar url for a known email entity" do
        # #7
        expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
        # #8
        expect(known_user.avatar_url(48)).to eq(expected_gravatar)
      end
>>>>>>> fedacbc646599728313cea0423e1c345a7bb5bc3
    end
  end

  describe "#favorite_for(post)" do
     before do
       topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
       @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
     end

     it "returns `nil` if the user has not favorited the post" do
       expect(user.favorite_for(@post)).to be_nil
     end

     it "returns the appropriate favorite if it exists" do
       favorite = user.favorites.where(post: @post).create
       expect(user.favorite_for(@post)).to eq(favorite)
     end
   end
end


