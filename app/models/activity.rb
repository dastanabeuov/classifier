class Activity < ApplicationRecord
  belongs_to :user

  has_many :properties

  has_ancestry

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  
  # translates :name, :description, :synonym
end