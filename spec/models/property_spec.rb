require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should belong_to(:user) }
end
