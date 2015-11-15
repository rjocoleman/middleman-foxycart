require 'middleman-core'

class Foxycart < ::Middleman::Extension
  option :api_key,  ENV['FOXYCART_API_KEY'], 'FoxyCart API key'
  option :url, ENV['FOXYCART_URL'], 'FoxyCart domain'
  option :auto_encode_hrefs, true, 'Automatically encode HREFs with product validation hashes?'

  def initialize(app, options_hash={}, &block)
    super

    require 'foxycart_helpers'

    FoxycartHelpers.configure do |config|
      config.api_key =  options.api_key
      config.url = options.url
      config.auto_encode_hrefs = options.auto_encode_hrefs
    end
  end

  helpers do
    def foxycart_encode(code, name, value)
      FoxycartHelpers::ProductVerification.encode code, name, value
    end

    def foxycart_encoded_name(code, name, value)
      FoxycartHelpers::ProductVerification.encoded_name code, name, value
    end

    def foxycart_url_for(name, price, code=nil, opts={})
      FoxycartHelpers::Link.href name, price, code, opts
    end

    def foxycart_loader_js_url
      FoxycartHelpers::Javascript.url
    end

    def foxycart_loader_js
      FoxycartHelpers::Javascript.html_element
    end
  end
end

Foxycart.register(:foxycart)
