require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
  end
end
