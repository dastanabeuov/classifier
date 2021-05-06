require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should belong_to(:propertyable) }
  it { should belong_to(:activity) }

  it { should validate_presence_of(:title) }
end