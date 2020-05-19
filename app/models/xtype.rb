class Xtype < ApplicationRecord
  belongs_to :user

  has_many :xclasses

  validates :name, presence: true

  translates :name, :description, :synonym, :code, :version_date, :publish, :user_id
  accepts_nested_attributes_for :translations, allow_destroy: true
end
