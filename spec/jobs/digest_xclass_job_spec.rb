require 'rails_helper'

RSpec.describe DigestXclassJob, type: :job do
  let(:service) { double('DigestXclass') }

  before do
    allow(DigestXclass).to receive(:new).and_return(service)
  end

  it 'calls DigestXclass#send_digest' do
    expect(service).to receive(:send_digest)
    DigestXclassJob.perform_now
  end
end
