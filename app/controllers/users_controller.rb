class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@communities = @user.communities
  	@posts = @user.posts
  end
end
