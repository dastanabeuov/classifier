class AddPositionToXclass < ActiveRecord::Migration[5.0]
  def up
    add_column :xclasses, :position, :string
    add_index :xclasses, :position
  end

  def down
    remove_column :xclasses, :position, :string
    remove_index :xclasses, :position
  end  
end
