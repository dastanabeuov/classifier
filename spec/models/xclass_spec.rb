require 'rails_helper'

RSpec.describe Xclass, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:xcategory) }
  it { should have_many(:properties).dependent(:destroy).class_name('Property') }

  it { should validate_presence_of(:title) }
end
