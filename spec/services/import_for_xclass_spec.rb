# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportForXclass do
  describe 'import' do
    let(:user) { create(:user) }
    let(:xclass) { create(:xclass, user: user) }
    file = File.new(Rails.root + 'spec/support/file/classifier_2.xlsx')
    subject { ImportForXclass.new(file, xclass, user) }

    it 'calls Services::ImportForXclass#import' do
      count = xclass.xclasses.count
      
      expect(ImportForXclass).to receive(:import).with(file, xclass, user)
      expect(xclass.xclasses.count).to be > count
    end
  end
end
