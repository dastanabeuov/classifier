class CreateXroots < ActiveRecord::Migration[5.0]
  def change
    create_table :xroots do |t|
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
    remove_table :xroots do |t|
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
