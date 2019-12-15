class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :comment_id
      t.string :status
      t.boolean :checked

      t.timestamps
    end
  end
end
