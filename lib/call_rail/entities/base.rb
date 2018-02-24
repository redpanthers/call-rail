module CallRail
  class Base
    attr_accessor :id, :name, :outbound_recording_enabled

    class <<self
      attr_accessor :attributes
    end

    def self.attr_accessor(*args)
      @attributes ||= []
      @attributes.concat args
      super(*args)
    end

    def attributes
      self.class.attributes
    end

    def attributes_hash
      attributes.map { |attribute| { attribute => send(attribute) } }.reduce({}, :merge)
    end

    def initialize(options = {})
      return unless options.is_a?(Hash)
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all(options = {})
      options_params = URI.encode_www_form(options)
      uri = URI.parse(BASE_URI + (url_param_name % options) + '.json' + "?#{options_params}")

      response = send_request(uri)
      JSON.parse(response.body)[params_name].map do |agency|
        new(agency)
      end
    end

    def self.find(id, options= {})
      uri = URI.parse(BASE_URI + (url_param_name % options)  + "/#{id}.json")
      response = send_request(uri)
      new(JSON.parse(response.body))
    end

    def as_json
      {
        'id' => id,
        'name' => name,
        'outbound_recording_enabled' => outbound_recording_enabled
      }
    end

    private

    def self.send_request(uri)
      request = Net::HTTP::Get.new(uri)
      request['Authorization'] = "Token token=#{CallRail.api_key}"

      req_options = {
        use_ssl: uri.scheme == 'https'
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      raise PermissionDeniedError if response.code == '401'
      raise InvalidParametersError if response.code == '400'
      response
    end
  end
end
