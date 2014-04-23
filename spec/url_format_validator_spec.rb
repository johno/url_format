require 'spec_helper'

describe UrlFormatValidator do

  let(:fake_model) { FakeModel.new }

  context 'with valid urls' do

    let(:valid_urls) { %w(http://google.com https://www.google.com www.google.com google.com) }

    it 'should be happy' do
      valid_urls.each do |url|
        fake_model.url = url
        expect(fake_model.valid?).to be_true
      end
    end
  end

  context 'with invalid urls' do

    let(:invalid_urls) { %w(invalid http://invalid..com, invalid..com) }

    it 'should not be happy' do
      invalid_urls.each do |invalid_url|
        fake_model.url = invalid_url
        expect(fake_model.valid?).to be_false
      end
    end
  end
end
