require 'rails_helper'

RSpec.describe Xcategory, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:xclasses).dependent(:destroy) }
end