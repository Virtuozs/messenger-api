class CreateUserMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_messages do |t|
      t.integer :conversation_id
      t.integer :sender_id
      t.text :body

      t.timestamps
    end
  end
end
