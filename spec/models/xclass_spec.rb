require 'rails_helper'

RSpec.describe Xclass, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:xclasses).class_name('Xclass') }
end