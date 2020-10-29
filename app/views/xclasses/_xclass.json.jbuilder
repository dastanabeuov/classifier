json.extract! xclass, :id, :name, :description, 
:synonym, :code, :version_date, :publish, 
:xtype, :position, :ancestry, 
:user_id, :xcategory_id, 
:created_at, :updated_at
json.url xclass_url(xclass, format: :json)
