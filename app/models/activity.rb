class Activity < ApplicationRecord
  belongs_to :user

  has_many :properties

  has_ancestry

  translates :name, :description, :synonym
end