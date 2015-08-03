class ConversationsController < ApplicationController

  def index
    @conversation_new = Conversation.new
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to '/messages/' + @conversation.id.to_s

  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversation_new = Conversation.new
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end


  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def interlocutor(conversation)
      current_user == conversation.recipient ? conversation.sender : conversation.recipient
    end

end
