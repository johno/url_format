class UrlFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    format_value(record, attribute, value)
    unless URI.parse(value).kind_of?(URI::HTTP) && value =~ url_regexp
      record.errors[attribute] << (options[:message] || "is invalid")
    end
  rescue URI::InvalidURIError
    record.errors[attribute] << (options[:message] || "is invalid")
  end

  def format_value(record, attribute, value)
    record.send("#{attribute}=","http://#{value}") unless value =~ /\Ahttps?:\/\//
  end

  # Thanks to Dean Perry and Ryan Bates 
  # https://github.com/deanperry/url_formatter/blob/master/lib/url_formatter.rb
  def url_regexp
    /\Ahttps?:\/\/([\A\s:@]+:[\A\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?\z/iux
  end
end
