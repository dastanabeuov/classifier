class CreateXclassTranslations < ActiveRecord::Migration[5.0]
  def up
    Xclass.create_translation_table!({
      name: :string,
      description: :text,
      synonym: :text,
      code: :string,
      version_date: :date,
      publish: :boolean,
      user_id: :integer,
      xcategory_id: :integer
    }, {
      migrate_data: true
    })
  end

  def down
    Xclass.drop_translation_table! migrate_data: true
  end 
end
