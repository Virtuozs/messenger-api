class ConversationsController < ApplicationController

    def index
      conversations = @current_user.conversations
      conversations_serialized = conversations.map do |conversation|
        ConversationSerializer.new(conversation, @current_user).as_json
      end
      if conversations.nil?
        render json: {data: []}, status: :ok
      else
        render json: {data: conversations_serialized}, status: :ok
      end
    end

    def show
      conversation= Conversation.find(params[:id])
      if conversation
        if conversation.sender == @current_user
          conversation_serialized = ConversationSerializer.new(conversation, @current_user).detail_as_json
          render json: {data: conversation_serialized}, status: :ok
        else
          render json: {error: "Unauthorized access."}, status: :forbidden
        end
      else
        render json: {error: "Conversation not found."}, status: :not_found
      end
    end 

    def conversation_messages
      conversation = Conversation.find(params[:id])
      if conversation
        if conversation.sender == @current_user
          messages = conversation.user_messages
          messages_serialized = messages.map do |message|
            MessageSerializer.new(message, @current_user).as_json
          end
          render json: {data: messages_serialized}, status: :ok
        else
          render json: {error: "Unauthorized access."}, status: :forbidden
        end
      else
        render json: {error: "Conversation not found."}, status: :not_found
      end
    end 
    # puts "messages : #{messages.first.as_json}"
  end
