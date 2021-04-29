class XclassSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :synonym, 
  :code, :version_date, :publish, :xtype, :position, 
  :ancestry, :xcategory_id, :user_id, :created_at, :updated_at

  # def short_title
  #   object.title.truncate(7)
  # end
end
