# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property, type: :model do
  it { is_expected.to belong_to(:propertyable) }
  it { is_expected.to belong_to(:activity) }
end
