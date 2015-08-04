class ConversationsController < ApplicationController

  def index
    @conversation_new = Conversation.new
    @conversations = Conversation.involving(current_user).order("created_at DESC")
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
    if params[:message_content] != "" #LOAD MORE GENERATING
      @message = Message.new
      @message.user = current_user
      @message.conversation_id = params[:id]
      @message.body = params[:message_content]
      @message.save
    end
    if params[:last_id]#LOAD MORE GENERATING
      @conversation = Conversation.find(params[:id])
      @messages = @conversation.messages.where("id > ?", params[:last_id])
    else
      @conversations = Conversation.involving(current_user).order("created_at DESC")
      @conversation = Conversation.find(params[:id])
      @conversation_new = Conversation.new
      @reciever = interlocutor(@conversation)
      @messages = @conversation.messages
      @message = Message.new
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def interlocutor(conversation)
      current_user == conversation.recipient ? conversation.sender : conversation.recipient
    end

end
