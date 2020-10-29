require 'rails_helper'

RSpec.describe Xroot, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:xcategories).dependent(:destroy) }
end