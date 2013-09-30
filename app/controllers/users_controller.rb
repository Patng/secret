class UsersController < ApplicationController
	before_filter :authenticate_user!
	
  def show
  	@user = current_user
  	@communities = @user.communities.order("created_at desc")
  	@posts = @user.posts.order("created_at desc")
  end
end
