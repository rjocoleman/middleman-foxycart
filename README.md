# middleman-foxycart

A [Middleman](https://middlemanapp.com) extension for use with [FoxyCart](http://www.foxycart.com/).

__Features__

* HMAC Product Verification - https://wiki.foxycart.com/v/2.0/hmac_validation
* Link href builder (with support for Product Verification)
* Generation of the store `loader.js` Javascript URL and HTML.


## Setup and Configuration

In `config.rb`

```ruby
activate :foxycart do |foxycart|
  foxycart.api_key = 'your foxycart api key' # also as `ENV['FOXYCART_API_KEY']`
  foxycart.url = 'https://mystoreurl.foxycart.com' # also as `ENV['FOXYCART_URL']`
  foxycart.auto_encode_hrefs = true # (default) Use HMAC Product Verification when generating links
end
```

## Helper and Usage

Examples for ERB templates:

```ruby
# JS helper, e.g. use in layout.erb
<%= foxycart_loader_js %>
# => "<script src=\"https://cdn.foxycart.com/example/loader.js\" async defer></script>"

# URL Helper
<%= foxycart_url_for('Cool Example', '10', 'sku123') %>
# => "https://example.foxycart.com/cart?name=Cool+Example&price=10&color=red"
<%= link_to 'Click the Link', foxycart_url_for('Cool Example', '10', 'sku123') %>
# => "<a href=\"https://example.foxycart.com/cart?name=Cool+Example&price=10&color=red\">Click the Link</a>"

# Product Verification link payloads
<%= foxycart_encode 'sku123', 'name', 'Cool Example' %>
# => "54a534ba0afef1b4589c2f77f9011e27089c0030a8876ec8f06fca281fedeb89"
<%= foxycart_encoded_name 'sku123', 'name', 'Cool Example' %>
# => "name||54a534ba0afef1b4589c2f77f9011e27089c0030a8876ec8f06fca281fedeb89"
```

`foxycart_url_for` and the Product Verification helpers arguments are:

* `code` = Product code (`sku123`)
* `name` = Value of name field in the HTML (`name`)
* `value` = Value (or initial value) of the input etc (`Cool Example`)

See the [FoxyCart docs](https://wiki.foxycart.com/v/2.0/hmac_validation) for more information on `code`, `name` and `value`.


## Contributing

Under the hood uses the gem [`foxycart_helpers`](https://github.com/rjocoleman/foxycart_helpers) (Foxycart helpers for plain Ruby and Rails)- this is just a thin wrapper for Middleman.

Bug reports and pull requests are welcome on GitHub on this repo if approparte or at https://github.com/rjocoleman/foxycart_helpers.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
