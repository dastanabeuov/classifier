json.extract! xcategory, :id, :name, :description, :synonym, 
:code, :version_date, :publish, :xroot_id, :user_id, 
:created_at, :updated_at
json.url xcategory_url(xcategory, format: :json)
