class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, :null => false
      t.text :description, :null => false, :default => ""
      t.string :slug, :null => false

      t.timestamps
    end
  end
end
