class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@communities = @user.communities
  end
end
