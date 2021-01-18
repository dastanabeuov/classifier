require 'rails_helper'

RSpec.describe Xcategory, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:xroot) }
  it { should have_many(:xclasses).dependent(:destroy) }
  it { should have_many(:properties).dependent(:destroy).class_name('Property') }

  it { should validate_presence_of(:name) }
end