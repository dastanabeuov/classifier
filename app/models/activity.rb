# frozen_string_literal: true

class Activity < ApplicationRecord
  include Propertyable

  belongs_to :user

  has_ancestry

  validates :title, presence: true, length: { minimum: 2 }
end
