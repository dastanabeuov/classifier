json.extract! xroot, :id, :name, :description, 
                     :synonym, :code, :version_date, 
                     :publish, :ancestry, :created_at, :updated_at
json.url xroot_url(xroot, format: :json)
