# frozen_string_literal: true

class CreateXclasses < ActiveRecord::Migration[5.2]

  def up
    create_table :xclasses do |t|
      t.string :title, null: false
      t.string :synonym
      t.text :description
      t.string :code
      t.text :full_code, null: false, unique: true
      t.date :version_date
      t.boolean :publish
      t.boolean :xtype
      t.string :position
      t.text :ancestry
      t.integer :ancestry_depth, default: 0
      t.integer :xcategory_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :xclasses, :user_id
    add_index :xclasses, :xcategory_id
    add_index :xclasses, :position
    add_index :xclasses, :ancestry
  end

  def down
    remove_table :xclasses do |t|
      t.string :title, null: false
      t.string :synonym
      t.text :description
      t.string :code
      t.text :full_code, null: false, unique: true
      t.date :version_date
      t.boolean :publish
      t.boolean :xtype
      t.string :position
      t.text :ancestry
      t.integer :ancestry_depth, default: 0
      t.integer :xcategory_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    remove_index :xclasses, :user_id
    remove_index :xclasses, :xcategory_id
    remove_index :xclasses, :position
    remove_index :xclasses, :ancestry
  end
end
