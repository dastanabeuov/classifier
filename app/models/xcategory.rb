class Xcategory < ApplicationRecord
  belongs_to :user
  belongs_to :xroot

  validates :name, :description, presence: true    

  has_many :xclasses, dependent: :destroy
  has_many :properties, as: :propertyable, :inverse_of => :propertyable

  translates :name, :description, :synonym, :code, :version_date, :publish, :user_id, :xroot_id
  accepts_nested_attributes_for :translations, allow_destroy: true         
end
