class UsersController < ApplicationController
	before_filter :authenticate_user!
	
  def show
  	@user = current_user
   	@posts = @user.posts.order("created_at desc").page(params[:page]).per_page(10)
  	@communities = @user.communities.order("created_at desc")

  end
end
