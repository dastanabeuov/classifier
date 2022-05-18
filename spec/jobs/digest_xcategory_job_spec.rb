require 'rails_helper'

RSpec.describe DigestXcategoryJob, type: :job do
  let(:service) { double('DigestXcategory') }

  before do
    allow(DigestXcategory).to receive(:new).and_return(service)
  end

  it 'calls DigestXcategory#send_digest' do
    expect(service).to receive(:send_digest)
    DigestXcategoryJob.perform_now
  end
end
