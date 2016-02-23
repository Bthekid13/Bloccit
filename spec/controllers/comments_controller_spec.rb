require 'rails_helper'
<<<<<<< HEAD
include RandomData
include SessionsHelper
=======
include SessionsHelper
include RandomData
>>>>>>> checkpoint-41

RSpec.describe CommentsController, type: :controller do
  let(:my_user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:other_user) { User.create!(name: RandomData.random_name, email: RandomData.random_email, password: "helloworld", role: :member) }
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }
  let(:my_comment) { Comment.create!(body: 'Comment Body', post: my_post, user: my_user) }

<<<<<<< HEAD
  # #6
  context "guest" do
    describe "POST create" do
      it "redirects the user to the sign in view" do
        post :create, format: :js, post_id: my_post.id, comment: {body: RandomData.random_paragraph}
=======
# #6
  context "guest" do
    describe "POST create" do
      it "redirects the user to the sign in view" do
        post :create, post_id: my_post.id, comment: {body: RandomData.random_paragraph}
>>>>>>> checkpoint-41
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "redirects the user to the sign in view" do
<<<<<<< HEAD
        delete :destroy, format: :js, post_id: my_post.id, id: my_comment.id
=======
        delete :destroy, post_id: my_post.id, id: my_comment.id
>>>>>>> checkpoint-41
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

<<<<<<< HEAD
  # #7
=======
# #7
>>>>>>> checkpoint-41
  context "member user doing CRUD on a comment they don't own" do
    before do
      create_session(other_user)
    end

    describe "POST create" do
      it "increases the number of comments by 1" do
<<<<<<< HEAD
        expect{ post :create, format: :js, post_id: my_post.id, comment: {body: RandomData.random_sentence} }.to change(Comment,:count).by(1)
      end

      it "returns http success" do
        post :create, format: :js, post_id: my_post.id, comment: {body: RandomData.random_paragraph}
        expect(response).to have_http_status(:success)
      end
    end


    describe "DELETE destroy" do
      it "redirects the user to the posts show view" do
        delete :destroy, format: :js, post_id: my_post.id, id: my_comment.id
=======
        expect{ post :create, post_id: my_post.id, comment: {body: RandomData.random_sentence} }.to change(Comment,:count).by(1)
      end

      it "redirects to the post show view" do
        post :create, post_id: my_post.id, comment: {body: RandomData.random_sentence}
        expect(response).to redirect_to [my_topic, my_post]
      end
    end

    describe "DELETE destroy" do
      it "redirects the user to the posts show view" do
        delete :destroy, post_id: my_post.id, id: my_comment.id
>>>>>>> checkpoint-41
        expect(response).to redirect_to([my_topic, my_post])
      end
    end
  end


<<<<<<< HEAD
  # #8
=======
# #8
>>>>>>> checkpoint-41
  context "member user doing CRUD on a comment they own" do
    before do
      create_session(my_user)
    end

    describe "POST create" do
      it "increases the number of comments by 1" do
<<<<<<< HEAD
        expect{ post :create, format: :js, post_id: my_post.id, comment: {body: RandomData.random_sentence} }.to change(Comment,:count).by(1)
      end

      it "returns http success" do
        post :create, format: :js, post_id: my_post.id, comment: {body: RandomData.random_paragraph}
        expect(response).to have_http_status(:success)
=======
        expect{ post :create, post_id: my_post.id, comment: {body: RandomData.random_sentence} }.to change(Comment,:count).by(1)
      end

      it "redirects to the post show view" do
        post :create, post_id: my_post.id, comment: {body: RandomData.random_sentence}
        expect(response).to redirect_to [my_topic, my_post]
>>>>>>> checkpoint-41
      end
    end

    describe "DELETE destroy" do
      it "deletes the comment" do
<<<<<<< HEAD
        delete :destroy, format: :js, post_id: my_post.id, id: my_comment.id
=======
        delete :destroy, post_id: my_post.id, id: my_comment.id
>>>>>>> checkpoint-41
        count = Comment.where({id: my_comment.id}).count
        expect(count).to eq 0
      end

<<<<<<< HEAD
      it "returns http success" do
        delete :destroy, format: :js, post_id: my_post.id, id: my_comment.id
        expect(response).to have_http_status(:success)
=======
      it "redirects to the post show view" do
        delete :destroy, post_id: my_post.id, id: my_comment.id
        expect(response).to redirect_to [my_topic, my_post]
>>>>>>> checkpoint-41
      end
    end
  end

<<<<<<< HEAD
  # #9
=======
# #9
>>>>>>> checkpoint-41
  context "admin user doing CRUD on a comment they don't own" do
    before do
      other_user.admin!
      create_session(other_user)
    end

    describe "POST create" do
      it "increases the number of comments by 1" do
        expect{ post :create, post_id: my_post.id, comment: {body: RandomData.random_sentence} }.to change(Comment,:count).by(1)
      end

      it "redirects to the post show view" do
        post :create, post_id: my_post.id, comment: {body: RandomData.random_sentence}
<<<<<<< HEAD
        expect(response).to have_http_status(:success)
=======
        expect(response).to redirect_to [my_topic, my_post]
>>>>>>> checkpoint-41
      end
    end

    describe "DELETE destroy" do
      it "deletes the comment" do
<<<<<<< HEAD
        delete :destroy, format: :js, post_id: my_post.id, id: my_comment.id
=======
        delete :destroy, post_id: my_post.id, id: my_comment.id
>>>>>>> checkpoint-41
        count = Comment.where({id: my_comment.id}).count
        expect(count).to eq 0
      end

      it "redirects to the post show view" do
<<<<<<< HEAD
        delete :destroy, format: :js, post_id: my_post.id, id: my_comment.id
        expect(response).to have_http_status(:success)
=======
        delete :destroy, post_id: my_post.id, id: my_comment.id
        expect(response).to redirect_to [my_topic, my_post]
>>>>>>> checkpoint-41
      end
    end
  end
end
