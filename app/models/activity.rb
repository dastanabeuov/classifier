# frozen_string_literal: true

class Activity < ApplicationRecord
  include Propertyable

  belongs_to :user

  has_ancestry

  validates :title, presence: true, length: { minimum: 2 }

  validates :code, presence: true, length: { minimum: 1 }, uniqueness: true
end
