class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :guid
      t.text :entry
      t.integer :subscription_id

      t.timestamps
    end

    add_index :posts, [:subscription_id, :guid], :unique => true
  end
end
