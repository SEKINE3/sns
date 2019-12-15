class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :following_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :relationships, :following_id #検索し易くするためindexを追加
    add_index :relationships, :followed_id #検索し易くするためindexを追加
    add_index :relationships, [:following_id, :followed_id], unique: true #テーブル内での重複の禁止(unique: true)
  end
end
