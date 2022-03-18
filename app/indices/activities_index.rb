ThinkingSphinx::Index.define :activity, with: :active_record do
  #fileds
  indexes title, sortable: true
  indexes synonym
  indexes description
  indexes code

  # attributes
  has version_date, publish, position, ancestry, user_id, created_at, updated_at
end