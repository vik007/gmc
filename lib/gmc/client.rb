# frozen_string_literal: true

module Gmc
  class Client
    def initialize(config_arg = {})
      @config = Gmc.config.reverse_duplicate_merge(config_arg)
    end

    def create(**args)
      body = {}
      body[:offerId] = args[:id]
      body[:title] = args[:title]
      body[:description] = args[:description]
      body[:link] = args[:link]
      body[:imageLink] = args[:image_link]
      body[:contentLanguage] = args[:content_language] || @config.language
      body[:targetCountry] = args[:target_country] || @config.country
      body[:brand] = args[:brand]
      body[:feedLabel] = args[:feed_label] || @config.country
      body[:channel] = args[:channel] || "online"
      body[:availability] = args[:availability] || "in stock"
      body[:condition] = args[:condition] || "new"
      body[:price] = {}
      body[:price][:currency] = args[:currency] || @config.currency
      body[:price][:value] = args[:price]

      call("/products", body, "POST")
    end

    def update(**args)
      body = {}
      body[:title] = args[:title]
      body[:description] = args[:description]
      body[:link] = args[:link]
      body[:imageLink] = args[:image_link]
      body[:availability] = args[:availability] || "in stock"
      body[:condition] = args[:condition] || "new"
      body[:price] = {}
      body[:price][:currency] = args[:currency] || @config.currency
      body[:price][:value] = args[:price]

      call("/products/#{args[:id]}", body, "PATCH")
    end

    def destroy(id)
      call("/products/#{id}", "DELETE")
    end

    def product(id)
      call("/products/#{id}", nil)
    end

    def products
      call("/products", nil)
    end

    private

    def call(endpoint, body, method_name = "GET")
      url = URI("#{@config.base_url}/#{@config.merchant_id}#{endpoint}?key=#{@config.api_key}")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      case method_name
      when "POST"
        request = Net::HTTP::Post.new(url)
        request.body = JSON.dump(body)
      when "PATCH"
        request = Net::HTTP::Patch.new(url)
        request.body = JSON.dump(body)
      when "DELETE"
        request = Net::HTTP::Delete.new(url)
      else
        request = Net::HTTP::Get.new(url)
      end

      request["Authorization"] = "Bearer #{@config.access_token}"
      request["Accept"] = "application/json"
      request["Content-Type"] = "application/json"
      response_formate(https.request(request))
    end

    def response_formate(res)
      OpenStruct.new({ code: res.code, data: JSON.parse(res.read_body) })
    rescue StandardError => e
      OpenStruct.new({ code: res.code, data: res.read_body, exception_message: e.to_s })
    end
  end
end
