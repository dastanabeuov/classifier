class CreateXcategories < ActiveRecord::Migration[5.0]
  def up
    create_table :xcategories do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :xroot_id

      t.string :position
      t.string :ancestry

      t.timestamps
    end
    add_index :xcategories, :position
    add_index :xcategories, :ancestry    
  end

  def down
    remove_table :xcategories do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :xroot_id

      t.string :position      
      t.string :ancestry

      t.timestamps
    end
    remove_index :xcategories, :position
    remove_index :xcategories, :ancestry    
  end
end
