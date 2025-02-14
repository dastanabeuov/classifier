# frozen_string_literal: true

class CreateXroots < ActiveRecord::Migration[5.2]

  def up
    create_table :xroots do |t|
      t.string :title, null: false
      t.string :synonym
      t.text :description
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :xroots, :user_id
  end

  def down
    remove_table :xroots do |t|
      t.string :title, null: false
      t.string :synonym
      t.text :description
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    remove_index :xroots, :user_id
  end
end
