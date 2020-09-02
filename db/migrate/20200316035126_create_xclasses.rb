class CreateXclasses < ActiveRecord::Migration[5.0]
  def up
    create_table :xclasses do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.boolean :xtype
      t.string :position
      t.string :ancestry

      t.timestamps
    end
    add_index :xclasses, :position
    add_index :xclasses, :ancestry
  end

  def down
    remove_table :xclasses do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.boolean :xtype
      t.string :position
      t.string :ancestry

      t.timestamps
    end
    remove_index :xclasses, :position
    remove_index :xclasses, :ancestry
  end 
end