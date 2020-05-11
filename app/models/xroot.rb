class Xroot < ApplicationRecord
  belongs_to :user

  has_many :xcategories, dependent: :destroy
  has_many :properties, as: :propertyable, :inverse_of => :propertyable

  #validates :name, presence: true
  
  translates :name, :description, :synonym, :code, :version_date, :publish, :user_id
  accepts_nested_attributes_for :translations, allow_destroy: true
end
