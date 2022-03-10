# frozen_string_literal: true

class Xcategory < ApplicationRecord
  include Importable
  include Propertyable

  belongs_to :user
  belongs_to :xroot, touch: true

  has_many :xclasses, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
end
