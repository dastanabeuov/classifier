require 'rails_helper'

RSpec.describe DigestXcategoryJob, type: :job do
  let(:service) { double('Service::DigestXcategory') }

  before do
    allow(Services::DigestXcategory).to receive(:new).and_return(service)
  end

  it 'calls Service::DigestXcategory#send_digest' do
    expect(service).to receive(:send_digest)
    DigestXcategoryJob.perform_now
  end
end
