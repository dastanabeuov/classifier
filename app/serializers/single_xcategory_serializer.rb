class SingleXcategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :synonym, :code, 
  :version_date, :publish, :xroot_id, :user_id, :created_at, :updated_at
  
  belongs_to :user
  belongs_to :xroot

  has_many :xclasses
  has_many :properties

  def properties
    object.properties.order(id: :asc)
  end
  # def short_title
  #   object.title.truncate(7)
  # end
end
