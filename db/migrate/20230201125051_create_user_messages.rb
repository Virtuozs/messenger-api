class CreateUserMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_messages do |t|
      t.integer :conversation_id
      t.integer :sender_id
      t.text :body
      t.datetime :read_at, default: nil
      t.datetime :send_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end
