class MessagesController < ApplicationController
    def create
        recipient = User.find(params[:user_id])
        message_body = params[:message]
        if message_body.nil? || message_body.empty?
          render json: {error: "Invalid Request"}, status: :unprocessable_entity
        else
          conversation = Conversation.between(@current_user.id, recipient.id)
          if conversation.nil?
            conversation = Conversation.create(sender_id: @current_user.id, recipient_id: recipient.id)
          end
  
          message = UserMessage.new(conversation: conversation, sender: @current_user, body: message_body)
  
          if message.save
            message_serialized = MessageSerializer.new(message, @current_user).as_json
            render json: {data:message_serialized},status: :created
          else
            render json: { errors: message.errors }, status: :unprocessable_entity
          end
        end
    end
end