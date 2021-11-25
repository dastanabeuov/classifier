# frozen_string_literal: true

class Xroot < ApplicationRecord
  belongs_to :user

  has_many :xcategories, dependent: :destroy
  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 2 }
end
