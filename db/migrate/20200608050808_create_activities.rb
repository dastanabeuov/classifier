class CreateActivities < ActiveRecord::Migration[5.0]
  def up
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.string :position
      t.string :ancestry
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :position
    add_index :activities, :ancestry
  end

  def down
    remove_table :activities do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.string :position
      t.string :ancestry
      t.integer :user_id, null: false, foreign_key: true
      
      t.timestamps
    end
    remove_index :activities, :user_id
    remove_index :activities, :position
    remove_index :activities, :ancestry
  end  
end
