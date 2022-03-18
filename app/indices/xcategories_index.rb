ThinkingSphinx::Index.define :xcategory, with: :active_record do
  #fileds
  indexes title, sortable: true
  indexes synonym
  indexes description
  indexes code

  # attributes
  has publish, version_date, xroot_id, user_id, created_at, updated_at
end