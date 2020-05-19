class CreateXtypes < ActiveRecord::Migration[5.0]
  def up
    create_table :xtypes do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    remove_table :xtypes do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish
      t.integer :user_id

      t.timestamps
    end
  end  
end
