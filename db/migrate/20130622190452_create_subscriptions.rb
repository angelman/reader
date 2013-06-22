class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :feed_url
      t.text :feed

      t.timestamps
    end

    add_index :subscriptions, :feed_url, :unique => true
  end
end
