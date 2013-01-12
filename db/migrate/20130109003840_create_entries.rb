class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.string :entry_type, :null => false, :default => "blog"
      t.string :slug, :null => false
      
      t.timestamps
    end
  end
end
