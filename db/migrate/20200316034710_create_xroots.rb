class CreateXroots < ActiveRecord::Migration[5.0]
  def up
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

  reversible do |dir|
    dir.up do
      Xroot.create_translation_table! :name => :string, :description => :text, :synonym => :text,
      :code => :string, :version_date => :date, :publish => :boolean, :user_id => :integer
    end

    dir.down do
      Xroot.drop_translation_table!
    end
  end     
end
