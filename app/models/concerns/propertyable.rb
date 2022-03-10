module Propertyable
  extend ActiveSupport::Concern

  included do
    has_many :properties, dependent: :destroy, as: :propertyable

    accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true
  end
end