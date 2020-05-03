class Xroot < ApplicationRecord
  belongs_to :user

  validates :name, :description, presence: true

  has_many :xcategories, dependent: :destroy
  has_many :properties, as: :propertyable, :inverse_of => :propertyable
  
  translates :name, :description, :synonym, :code, :version_date, :publish, :user_id
  accepts_nested_attributes_for :translations, allow_destroy: true

  default_scope { order('name asc') }
end
