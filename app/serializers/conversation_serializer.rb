class ConversationSerializer
    def initialize(conversation, current_user)
      @conversation = conversation
      @current_user = current_user
    end
  
    def as_json(*)
      data = {
        id: @conversation.id,
        with_user: with_user_data,
        unread_count: unread_count,
        last_message: last_message_data,
      }
      data
    end

    def detail_as_json(*)
      data = {
        id: @conversation.id,
        with_user: with_user_data
      }
      data
    end 

    private
  
    def last_message_data
      message = @conversation.user_messages.last
      {
        id: message.id,
        sender: {
            id: message.sender.id,
            name: message.sender.name
        },
        sent_at: message.send_at,
      }
    end
  
    def unread_count
        unread = @conversation.user_messages.where(sender_id: @conversation.recipient_id).where.not(read_at: nil).count
        unread
    end
  
    def with_user_data
        user = @conversation.recipient_id == @current_user.id ? @conversation.sender : @conversation.recipient
        {
          id: user.id,
          name: user.name,
          photo_url: user.photo_url
        }
    end
  end