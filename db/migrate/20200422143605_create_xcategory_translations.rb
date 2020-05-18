class CreateXcategoryTranslations < ActiveRecord::Migration[5.0]
  def up
    Xcategory.create_translation_table!({
      name: :string,
      description: :text,
      synonym: :text,
      code: :string,
      version_date: :date,
      publish: :boolean,
      user_id: :integer,
      xroot_id: :integer
    }, {
      migrate_data: true
    })
  end

  def down
    Xcategory.drop_translation_table! migrate_data: true
  end  
end
