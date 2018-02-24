require 'call_rail/version'
require 'net/http'
require 'uri'
require 'json'

require_relative 'call_rail/entities/base'
require_relative 'call_rail/entities/account'
require_relative 'call_rail/entities/company'
require_relative 'call_rail/entities/call'

module CallRail
  class PermissionDeniedError < StandardError; end
  class InvalidParametersError < StandardError; end
  BASE_URI = 'https://api.callrail.com/v2/'.freeze
  class << self
    attr_accessor :api_key
  end

  def self.configure(params = {})
    @api_key = params[:api_key]
    yield(self) if block_given?
  end
end
