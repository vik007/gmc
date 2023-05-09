module Gmc
  class Configuration
    attr_accessor :merchant_id
    attr_accessor :currency
    attr_accessor :access_token
    attr_accessor :api_key
    attr_accessor :language
    attr_accessor :country
    attr_accessor :base_url

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def reverse_duplicate_merge(hash)
      dup.tap do |instance|
        hash.each do |option, value|
          instance.public_send("#{option}=", value)
        end
      end
    end

    def initialize
      @base_url = "https://shoppingcontent.googleapis.com/content/v2.1"
      @country = 'AU'
      @currency = 'AUD'
      @language = 'en'
    end
  end
end