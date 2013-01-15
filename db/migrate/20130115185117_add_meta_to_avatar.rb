class AddMetaToAvatar < ActiveRecord::Migration
  def self.up
    add_column :entries, :image_meta,    :text
  end

  def self.down
    remove_column :entries, :image_meta
  end
end