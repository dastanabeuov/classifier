class CreateXrootTranslations < ActiveRecord::Migration[5.0]
  def up
    Xroot.create_translation_table!({
      name: :string,
      description: :text,
      synonym: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Xroot.drop_translation_table! migrate_data: true
  end
end