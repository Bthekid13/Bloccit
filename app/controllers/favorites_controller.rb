class FavoritesController < ApplicationController
  # #11
  before_action :require_sign_in

  def create
    # #12
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Post favorited."
    else
      flash[:alert] = "Favoriting failed."
    end

    # #13
    redirect_to [post.topic, post]
  end
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Post unfavorited."
    else
      flash[:alert] = "Unfavoriting failed."
    end
    redirect_to [post.topic, post]
  end
end
