ThinkingSphinx::Index.define :xclass, with: :active_record do
  #fileds
  indexes title, sortable: true
  indexes synonym
  indexes description
  indexes code
  indexes full_code

  # attributes
  has version_date, publish, xtype, position, ancestry, 
  ancestry_depth, xcategory_id, user_id, created_at, updated_at
end