module CallRail
  class Company < Base
    attr_accessor :id, :name, :status, :time_zone, :created_at, :disabled_at, :script_url, 
      :callscore_enabled, :keyword_spotting_enabled, :callscribe_enabled, :lead_scoring_enabled, 
      :swap_exclude_jquery, :swap_ppc_override, :swap_landing_override, :swap_cookie_duration

    def self.url_param_name
      'a/%{account_id}/companies'
    end

    def self.params_name
      'companies'
    end

  end
end
