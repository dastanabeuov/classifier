# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:activities).dependent(:destroy) }
  it { is_expected.to have_many(:xroots).dependent(:destroy) }
  it { is_expected.to have_many(:xcategories).dependent(:destroy) }
  it { is_expected.to have_many(:xclasses).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  describe '.author_of?(resource)' do
    let(:user)  { create(:user) }
    let(:user2) { create(:user) }
    let(:xroot) { create(:xroot, user: user) }

    it 'valid author' do
      expect(user).to be_author_of(xroot)
    end

    it 'invalid author' do
      expect(user2).not_to be_author_of(xroot)
    end
  end
end
