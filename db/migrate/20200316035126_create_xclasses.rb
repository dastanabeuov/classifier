class CreateXclasses < ActiveRecord::Migration[5.0]
  def up
    create_table :xclasses do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id
      t.integer :xcategory_id

      t.timestamps
    end
  end

  def down
    remove_table :xclasses do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id
      t.integer :xcategory_id

      t.timestamps
    end
  end 
end
