class SingleActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :synonym,
             :code, :version_date, :publish, :position, :ancestry,
             :user_id, :created_at, :updated_at

  # def short_title
  #   object.title.truncate(7)
  # end
end
