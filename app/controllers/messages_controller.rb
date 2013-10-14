class MessagesController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_message

  def create
    @recipient = User.find(params[:message][:recipientid])
    current_user.send_message(@recipient, params[:message][:body], params[:message][:subject])
    redirect_to conversations_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @subject = params[:post_description]
    @recipientid = params[:post_userid]
  end
end
