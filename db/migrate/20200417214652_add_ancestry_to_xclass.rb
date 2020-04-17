class AddAncestryToXclass < ActiveRecord::Migration[5.0]
  def up
    add_column :xclasses, :ancestry, :string
    add_index :xclasses, :ancestry
  end

  def down
    remove_column :xclasses, :ancestry, :string
    remove_index :xclasses, :ancestry
  end  
end
