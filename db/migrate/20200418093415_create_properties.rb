class CreateProperties < ActiveRecord::Migration[5.0]
  def up
    create_table :properties do |t|
      t.text :content
      t.integer :propertyable_id
      t.string :propertyable_type

      t.timestamps
    end
    add_index :properties, :propertyable_id
    add_index :properties, :propertyable_type
  end

  def down
    remove_table :properties do |t|
      t.text :content
      t.integer :propertyable_id
      t.string :propertyable_type

      t.timestamps
    end
    remove_index :properties, :propertyable_id
    remove_index :properties, :propertyable_type
  end 
end
