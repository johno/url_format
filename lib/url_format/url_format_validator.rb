class UrlFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless URI.parse(value).kind_of?(URI::HTTP) && value =~ /\.\w{2,6}/
      record.errors[attribute] << (options[:message] || "is invalid")
    end
  rescue URI::InvalidURIError
    record.errors[attribute] << (options[:message] || "is invalid")
  end
end
