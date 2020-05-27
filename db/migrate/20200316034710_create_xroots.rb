class CreateXroots < ActiveRecord::Migration[5.0]
  def up
    create_table :xroots do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish

      t.string :position
      t.string :ancestry


      t.timestamps
    end
    add_index :xroots, :position
    add_index :xroots, :ancestry    
  end

  def down
    remove_table :xroots do |t|
      t.string :name
      t.text :description
      t.text :synonym
      t.string :code
      t.date :version_date
      t.boolean :publish

      t.string :position
      t.string :ancestry      

      t.timestamps
    end
    remove_index :xroots, :position
    remove_index :xroots, :ancestry        
  end   
end
