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

  reversible do |dir|
    dir.up do
      Translation.create_translation_table! :name => :string, :description => :text, :synonym => :text,
      :code => :string, :version_date => :date, :publish => :boolean, :user_id => :integer
    end

    dir.down do
      Translation.drop_translation_table!
    end
  end  
end
