class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :admin_user,     only: :destroy

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  # private
  #  # 管理者かどうか確認
  #  def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end

end
