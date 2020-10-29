json.extract! activity, :id, :name, :description, :synonym, :code, :version_date, 
:publish, :position, :ancestry, :user_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
