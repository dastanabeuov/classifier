require 'rails_helper'

RSpec.describe Services::DigestXcategory do
  let(:users) {create_list(:user, 3)}

  it 'sends digest xcategory to all users' do
    users.each {|user| expect(DigestXcategoryMailer).to receive(:digest).with(user).and_call_original}
    subject.send_digest
  end
end