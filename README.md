# UrlFormat

[![Build Status](https://travis-ci.org/johnotander/url_format.svg?branch=master)](https://travis-ci.org/johnotander/url_format)

This gem validates a URL, adds the `http://` prefix if not included, and provides a `get_domain` method.

## Installation

Add this line to your application's Gemfile:

    gem 'url_format'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url_format

## Usage

Using it is as simple as using the `validates` keyword in your model:

```ruby
class User < ActiveRecord::Base
  
  # ...

  validates :url, url_format: true

  # ...

end
```

Now the url attribute will be validated accordingly:

```ruby
User.new(url: 'http://example.com').valid? # => true
User.new(url: 'invalid_url..com').valid?    # => false
```

Also, the model in question doesn't need to inherit from ActiveRecord::Base, you only need to `include ActiveModel::Validations` in your class:

```ruby
require 'url_format'

class Awesome
  include ActiveModel::Validations

  attr_accessor :url

  validates :url, url_format: true

  def domain
    UrlFormat.get_domain(url)
  end
end

awesome = Awesome.new

awesome.url = "www.example.com"
awesome.valid? # => true
awesome.url    # => 'http://www.example.com'
awesome.domain # => 'example.com'

awesome.url = "invalid_url"
awesome.valid? # => false
```

The gem can ensure that a url is prefixed with `http://` as well:

```ruby
UrlFormat.ensure_http_prefix('google.com')         # => 'http://google.com'
UrlFormat.ensure_http_prefix('https://google.com') # => 'https://google.com'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
