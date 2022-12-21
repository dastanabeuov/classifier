# frozen_string_literal: true

class Xroot < ApplicationRecord
  include Propertyable

  belongs_to :user

  has_many :xcategories, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
end
