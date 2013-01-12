class AddImageToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :image, :string, :default => nil
    add_column :entries, :link, :string, :default => nil
  end
end
