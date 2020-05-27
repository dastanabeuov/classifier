json.extract! xcategory, :id, :name, :description, 
                         :synonym, :code, :version_date, 
                         :publish, :xroot_id, :ancestry, 
                         :created_at, :updated_at
json.url xcategory_url(xcategory, format: :json)
