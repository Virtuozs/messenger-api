class Conversation < ApplicationRecord
    belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
    belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  
    has_many :user_messages

    def self.between(sender_id, recipient_id)
        where(sender_id: sender_id, recipient_id: recipient_id).or(
          where(sender_id: recipient_id, recipient_id: sender_id)
        ).first
      end
end
