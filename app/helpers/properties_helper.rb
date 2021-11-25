# frozen_string_literal: true

module PropertiesHelper
  def count_properties
    properties ||= Property.all.size
    properties
  end
end
