class NewsfeedsController < ApplicationController
	before_filter :authenticate_user!
	
  def show
  	@user = current_user
  	@posts = @user.posts.order("created_at desc")
  	@communities = Community.all
  end
end
