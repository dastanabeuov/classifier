require 'rails_helper'

RSpec.describe Xroot, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should have_many(:xcategories).dependent(:destroy) }
    it { should have_many(:properties).dependent(:destroy) }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
  end
end