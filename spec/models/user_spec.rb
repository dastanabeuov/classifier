require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:activities).dependent(:destroy) }
  it { should have_many(:properties).dependent(:destroy) }
  it { should have_many(:xroots).dependent(:destroy) }
  it { should have_many(:xcategories).dependent(:destroy) }
  it { should have_many(:xclasses).dependent(:destroy) }
end