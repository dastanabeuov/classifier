require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { should have_many(:activities).dependent(:destroy) }
    it { should have_many(:xroots).dependent(:destroy) }
    it { should have_many(:xcategories).dependent(:destroy) }
    it { should have_many(:xclasses).dependent(:destroy) }
  end

  describe "Validation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe ".author_of?(resource)" do
    let(:user)  { create(:user) }
    let(:user2) { create(:user) }

    it "valid author" do
      xroot = create(:xroot, user_id: user.id )
      expect(user).to be_author_of(xroot)
    end

    it "invalid author" do
      xroot = create(:xroot, user_id: user.id )
      expect(user2).to_not be_author_of(xroot)
    end
  end
end