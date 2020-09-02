class CreateProperties < ActiveRecord::Migration[5.0]
  def up
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.string :position
      t.string :ancestry

      t.timestamps
    end
    add_index :properties, :position
    add_index :properties, :ancestry 
  end

  def down
    remove_table :properties do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.string :position
      t.string :ancestry

      t.timestamps
    end
    remove_index :properties, :position
    remove_index :properties, :ancestry
  end  
end
