json.extract! xclass, :id, :name, :description, 
                      :synonym, :code, :version_date, 
                      :publish, :xtype, :xcategory_id, 
                      :ancestry, :created_at, :updated_at
json.url xclass_url(xclass, format: :json)
