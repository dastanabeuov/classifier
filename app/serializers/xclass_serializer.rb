# frozen_string_literal: true

class XclassSerializer < ActiveModel::Serializer
  attributes :id, 
             :title, 
             :description, 
             :synonym,
             :code,
             :full_code,
             :version_date, 
             :publish, 
             :xtype, 
             :position,
             :ancestry, 
             :user_id, 
             :created_at, 
             :updated_at

  # belongs_to :user
  # belongs_to :xcategory

  # has_many :properties

  # def properties
  #   object.properties.order(id: :asc)
  # end

  # def short_title
  #   object.title.truncate(7)
  # end
end
