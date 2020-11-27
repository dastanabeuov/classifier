require 'rails_helper'

RSpec.describe Property, type: :model do
  describe "Association" do
    it { should belong_to(:propertyable) }
    it { should belong_to(:activity) }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
  end
end
