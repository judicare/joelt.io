class RemovePlainImageField < ActiveRecord::Migration
  def up
    remove_column :entries, :image
  end

  def down
  end
end
