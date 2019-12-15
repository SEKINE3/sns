class CreateMesseages < ActiveRecord::Migration[5.2]
  def change
    create_table :messeages do |t|
      t.integer :user_id
      t.integer :conversation_id
      t.text :body

      t.timestamps
    end
  end
end
