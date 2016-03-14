class AddColumnChatIdToMessages < ActiveRecord::Migration
  def change
    add_column :posts, :chat_id, :integer
  end
end
