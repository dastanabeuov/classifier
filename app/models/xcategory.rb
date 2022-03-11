# frozen_string_literal: true

class Xcategory < ApplicationRecord
  include Propertyable

  belongs_to :user
  belongs_to :xroot, touch: true

  has_many :xclasses, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }

  scope :one_day_ago, -> { where("created_at > ?", Time.now - 1.day) }

  def self.start_import(file, xcategory, user)
    Services::ImportForXcategory.new(file, xcategory, user).import
  end
end