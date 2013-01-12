class CreateEntriesTags < ActiveRecord::Migration
  def up
    create_table 'entries_tags', :id => false do |t|
      t.column :entry_id, :integer
      t.column :tag_id, :integer
    end
  end

  def down
    drop_table 'entries_tags'
  end
end
