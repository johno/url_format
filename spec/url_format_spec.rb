require 'spec_helper'

describe UrlFormat do

  subject { UrlFormat }

  describe '.get_domain' do

    let(:urls_with_domains) {
      {
        'http://google.com' => 'google.com',
        'https://fake.google.com' => 'fake.google.com',
        'www.fake.google.com/fake_stuff' => 'fake.google.com',
        'fake.fake.google.com' => 'fake.fake.google.com'
      }
    }

    it 'should return the proper domain' do
      urls_with_domains.each do |url, domain|
        expect(subject.get_domain(url)).to eq(domain)
      end
    end
  end

  describe '.ensure_http_prefix' do

    context 'without a prefix' do

      let(:url) { 'www.google.com' }

      it 'should prefix with http://' do
        expect(subject.ensure_http_prefix(url)).to eq("http://#{ url }")
      end
    end

    context 'with a prefix' do

      let(:urls) { %w(http://google.com https://google.com) }

      it 'should not modify the url' do
        urls.each do |url|
          expect(subject.ensure_http_prefix(url)).to eq(url)
        end
      end
    end
  end
end
