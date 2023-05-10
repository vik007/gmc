# frozen_string_literal: true

module Gmc
  # Google Merchant Configuration
  class Configuration
    attr_accessor :merchant_id, :currency, :access_token, :api_key, :language, :country, :base_url

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
      @country = "AU"
      @currency = "AUD"
      @language = "en"
    end
  end
end
