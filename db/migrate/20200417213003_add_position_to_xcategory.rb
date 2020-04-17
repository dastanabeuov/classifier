class AddPositionToXcategory < ActiveRecord::Migration[5.0]
  def up
    add_column :xcategories, :position, :string
    add_index :xcategories, :position
  end

  def down
    remove_column :xcategories, :position, :string
    remove_index :xcategories, :position
  end  
end
