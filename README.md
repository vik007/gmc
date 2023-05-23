# Simple REST APIs for Google Merchant Center

This repository contains Simple REST APIs for Google Merchant Center. Official API documentation [link](https://developers.google.com/shopping-content/reference/rest/v2.1/products)


## Usage

Install the client using `gem install` or by adding it to your `Gemfile`. Then, to use it.

```ruby
gem 'gmc'
```
And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gmc

After updating your bundle, run the installer

    $ rails g install gmc

## Usage


```ruby

    config = Gmc.config
    config.merchant_id = "<Merchant ID>"
    config.access_token = "<Access Token>"
    config.api_key = "<API Key>"

    # or Setup into config/gmc.rb file
```

>  Product Create Endpoint

```ruby

    gmc = Gmc::Client.new
    gmc.create(
        id: '454',
        title: 'Test',
        description: 'Test Des',
        link: 'https://examples.com/product',
        image_link: 'https://examples.com/product.png',
        content_language: 'en_US',
        target_country: 'AU',
        brand: 'Google',
        feed_label: 'AU',
        channel: 'online',
        availability: 'in stock',
        condition: 'new',
        currency: 'INR',
        price: '236.36'
    )
```

>  Product Update Endpoint

```ruby

    gmc = Gmc::Client.new
    gmc.update(
        id: '454',
        title: 'Test',
        description: 'Test Des',
        link: 'https://examples.com/product',
        image_link: 'https://examples.com/product.png',
        brand: 'Google',
        availability: 'in stock',
        currency: 'INR',
        price: '236.36'
    )
```

>  Product Delete Endpoint

```ruby

    gmc = Gmc::Client.new
    gmc.destroy(id: '454')
```

>  Product Detail Endpoint

```ruby

    gmc = Gmc::Client.new
    gmc.product(id: '454')
    gmc.products
```

## Supported Ruby versions

This library is supported on Ruby 2.5+.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gmc.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
