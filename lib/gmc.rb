# frozen_string_literal: true

require "json"
require "net/http"
require "rbconfig"
require "securerandom"
require "set"
require "socket"
require "uri"
require "forwardable"
require_relative "gmc/version"
require "gmc/client"
require "gmc/configuration"

# Google Merchant Center
module Gmc
  class Error < StandardError; end
  @config = Gmc::Configuration.setup

  class << self
    extend Forwardable

    attr_reader :config

    # User configurable options
    def_delegators :@config, :merchant_id, :merchant_id=
    def_delegators :@config, :currency, :currency=
    def_delegators :@config, :language, :language=
    def_delegators :@config, :country, :country=
    def_delegators :@config, :access_token, :access_token=
    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :base_url, :base_url=
  end
end
