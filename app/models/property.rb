# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :activity
  belongs_to :propertyable, polymorphic: true, touch: true
end
