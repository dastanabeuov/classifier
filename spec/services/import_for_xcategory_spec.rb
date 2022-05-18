# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportForXcategory do
  describe 'import' do
    let(:user) { create(:user) }
    let(:xroot) { create(:xroot, user: user) }
    let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
    file = File.new(Rails.root + 'spec/support/file/classifier_2.xlsx')
    subject { ImportForXcategory.new(file, xcategory, user) }

    it 'calls Services::ImportForXcategory#import' do
      count = xcategory.xclasses.count
      
      expect(ImportForXcategory).to receive(:import).with(file, xcategory, user)
      expect(xcategory.xclasses.count).to be > count
    end
  end
end
