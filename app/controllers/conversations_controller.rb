class ConversationsController < ApplicationController
	before_filter :authenticate_user!, :get_mailbox

  def index
  	conversation_count = @mailbox.conversations.count(distinct: true)
  	@conversations = @mailbox.conversations.paginate(page: params[:page], per_page: 10, total_entries: conversation_count)
  end

  def show
  	@conversation = Conversation.find_by_id(params[:id])
  	@receipts = @mailbox.receipts_for(@conversation).order("created_at asc")
    @conversation.mark_as_read(current_user)
  end

  def update
    @conversation = Conversation.find_by_id(params[:id])
    current_user.reply_to_conversation(@conversation, params[:reply][:body])
    redirect_to @conversation
  end

  private

  def get_mailbox
    @mailbox = current_user.mailbox
  end

end
