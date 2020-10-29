class CreateXcategoryTranslations < ActiveRecord::Migration[5.0]
  def up
    Xcategory.create_translation_table!({
      name: :string,
      description: :text,
      synonym: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Xcategory.drop_translation_table! migrate_data: true
  end
end