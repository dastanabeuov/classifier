class CreateProperties < ActiveRecord::Migration[5.0]
  def up
    create_table :properties do |t|
      t.string :title
      t.integer :activity_id
      t.belongs_to :propertyable, polymorphic: true

      t.timestamps
    end
    add_index :properties, :activity_id
  end

  def down
    remove_table :properties do |t|
      t.string :title
      t.integer :activity_id
      t.belongs_to :propertyable, polymorphic: true

      t.timestamps
    end
    remove_index :properties, :activity_id
  end
end
