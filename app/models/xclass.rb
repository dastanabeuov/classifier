# frozen_string_literal: true

class Xclass < ApplicationRecord
  #attr_accessor :parent_id

  include Propertyable

  belongs_to :user

  has_ancestry cache_depth: true

  validates :title, presence: true, length: { minimum: 2 }
  
  validates :code, presence: true, length: { minimum: 1 }

  validates :full_code, presence: true, uniqueness: true

  def self.start_import(file, user)
    ImportForXclass.new(file, user).import
  end
end
