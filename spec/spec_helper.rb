require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'active_model'
require 'url_format'

RSpec.configure do |config|
  config.color_enabled = true
end

class FakeModel
  include ActiveModel::Validations
  attr_accessor :url
  validates :url, url_format: true, allow_blank: true
end
