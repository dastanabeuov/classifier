class Property < ApplicationRecord
  # belongs_to :user
  belongs_to :activity
  belongs_to :propertyable, polymorphic: true

  # has_ancestry

  translates :name, :description, :synonym
end
