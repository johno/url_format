require "url_format/version"
require "url_format/url_format_validator"
require "uri"

module UrlFormat

  def self.get_domain(url)
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  rescue URI::InvalidURIError
  end
end
