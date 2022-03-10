# frozen_string_literal: true

class Xclass < ApplicationRecord
  include Propertyable
  
  belongs_to :user
  belongs_to :xcategory, touch: true

  has_ancestry cache_depth: true

  validates :title, presence: true, length: { minimum: 2 }
  validates :full_code, uniqueness: true
end
