ThinkingSphinx::Index.define :xclass, with: :active_record do
  #fileds
  indexes title, sortable: true
  indexes synonym
  indexes description
  indexes code
  indexes full_code
  indexes ancestry
  indexes user.email, as: :author, sortable: true

  # attributes
  has version_date, publish, xtype, position, 
  ancestry_depth, user_id, created_at, updated_at
end