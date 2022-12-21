# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Xcategory, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:xroot) }
  it { is_expected.to have_many(:xclasses).dependent(:destroy) }
  it { is_expected.to have_many(:properties).dependent(:destroy).class_name('Property') }

  it { is_expected.to validate_presence_of(:title) }
end
