class CreateXcategories < ActiveRecord::Migration[5.0]
  def up
    create_table :xcategories do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id
      t.integer :xroot_id

      t.timestamps
    end
  end

  def down
    remove_table :xcategories do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id, foreign_key: true
      t.integer :xroot_id, foreign_key: true

      t.timestamps
    end
  end
end
