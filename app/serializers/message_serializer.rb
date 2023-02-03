class MessageSerializer
    def initialize(message, current_user)
      @message = message
      @current_user = current_user
    end
  
    def as_json(*)
      data = {
        id: @message.id,
        message: @message.body,
        sender: with_sender,
        sent_at: @message.send_at
      }
      data
    end


    private
    
    def with_sender
        sender = @message.sender
        {
            id: sender.id,
            name: sender.name,
        }
    end 
  end