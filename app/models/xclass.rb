class Xclass < ApplicationRecord
  has_ancestry
  
  belongs_to :user
  belongs_to :xcategory

  has_many :properties, as: :propertyable, :inverse_of => :propertyable

  #translates :name, :description, :synonym, :code,
  #           :version_date, :publish, :user_id, :xcategory_id
  #accepts_nested_attributes_for :translations, allow_destroy: true
end
