class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :conversations, foreign_key: :sender_id
  has_many :received_conversations, foreign_key: :recepient_id, class_name: 'Conversation'
  
  has_many :messages, through: :conversations
  has_many :received_messages, through: :received_conversations, source: :user_messages
end
