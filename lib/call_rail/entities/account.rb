require_relative 'base'
module CallRail
  class Account < Base
    attr_accessor :id, :name, :outbound_recording_enabled

    def self.url_param_name
      'a'
    end

    def self.params_name
      'agencies'
    end

    def companies
      Company.all(account_id: id)
    end

    def calls
      Call.all(account_id: id)
    end
  end
end
