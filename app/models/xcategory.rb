class Xcategory < ApplicationRecord
  belongs_to :user
  belongs_to :xroot

  has_many :properties, as: :propertyable, :inverse_of => :propertyable
  has_many :xclasses, dependent: :destroy
end
