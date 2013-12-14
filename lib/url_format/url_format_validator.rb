class UrlFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless URI.parse(value).kind_of?(URI::HTTP)
      url_format_invalid(record, attribute, value)
    end
  rescue URI::InvalidURIError
    url_format_invalid(record, attribute, value)
  end

  def url_format_invalid(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is invalid")
  end
end
