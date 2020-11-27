require 'rails_helper'

RSpec.describe Xclass, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should belong_to(:xcategory) }
    it { should have_many(:properties).class_name('Property') }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
  end
end