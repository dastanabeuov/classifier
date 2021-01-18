require 'rails_helper'

RSpec.describe Xroot, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:xcategories).dependent(:destroy) }
  it { should have_many(:properties).dependent(:destroy).class_name('Property') }

  it { should validate_presence_of(:name) }
end