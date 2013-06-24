class AddPublishedDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    add_index :posts, :published_at, :order => { :published_at => :desc }
    add_index :posts, [:subscription_id, :published_at], :order => { :published_at => :desc }
  end
end
