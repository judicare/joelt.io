class AddPublishedToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :published, :boolean, :null => false, :default => false
  end
end
