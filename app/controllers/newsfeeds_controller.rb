class NewsfeedsController < ApplicationController
	before_filter :authenticate_user!
	
  def show
  	@user = current_user
  	@posts = @user.community_posts.order("created_at desc").page(params[:page]).per_page(10)
  	@communities = Community.order("created_at desc").first(5)
  	@notifications = current_user.mailbox.receipts.where(:is_read => false).count
	  respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @posts }
	    format.js
    end
  end
end

