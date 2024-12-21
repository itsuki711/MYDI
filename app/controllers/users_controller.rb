class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @user.posts.order(created_at: :desc)

  end

  def index
    if params[:search].present?
      search = params[:search]
      @posts = current_user.posts.where(['title LIKE ? OR tag LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      @posts = current_user.posts
    end
  end

  def liked
    @liked_posts = current_user.liked_posts
  end
 
    
end
