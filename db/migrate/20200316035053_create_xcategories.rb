# frozen_string_literal: true

<<<<<<< HEAD
class CreateXcategories < ActiveRecord::Migration[5.0]
=======
class CreateXcategories < ActiveRecord::Migration[5.2]
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
  def up
    create_table :xcategories do |t|
      t.string :title, null: false
      t.string :synonym
      t.text :description
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :xroot_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :xcategories, :user_id
    add_index :xcategories, :xroot_id
  end

  def down
    remove_table :xcategories do |t|
      t.string :title, null: false
      t.string :synonym
      t.text :description
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :xroot_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    remove_index :xcategories, :user_id
    remove_index :xcategories, :xroot_id
  end
end
