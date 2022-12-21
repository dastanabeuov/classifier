ThinkingSphinx::Index.define :property, with: :active_record do
  #fileds
  indexes title, sortable: true

  # attributes
  has activity_id, created_at, updated_at
end