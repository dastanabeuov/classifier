require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:activities).dependent(:destroy) }
  it { should have_many(:properties).dependent(:destroy) }
  it { should have_many(:xroots).dependent(:destroy) }
  it { should have_many(:xcategories).dependent(:destroy) }
  it { should have_many(:xclasses).dependent(:destroy) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe ".author_of?(resource)" do
    let(:user)  { create(:user) }
    let(:user2) { create(:user) }
    let(:xroot) { create(:xroot, :user user) }

    it "valid author" do
      expect(user).to be_author_of(xroot)
    end

    it "invalid author" do
      expect(user2).to_not be_author_of(xroot)
    end
  end
end