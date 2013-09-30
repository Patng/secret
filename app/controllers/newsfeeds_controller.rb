class NewsfeedsController < ApplicationController
	before_filter :authenticate_user!
	
  def show
  	@user = current_user
  	@posts = @user.posts
  end
end
