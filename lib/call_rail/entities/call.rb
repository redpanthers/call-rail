module CallRail
  class Call < Base
    attr_accessor :answered, :business_phone_number, :customer_city, :customer_country, 
      :customer_name, :customer_phone_number, :customer_state, :direction, :duration, :id, 
      :recording, :recording_duration, :recording_player, :start_time, :tracking_phone_number, 
      :voicemail 

    def self.url_param_name
      'a/%{account_id}/calls'
    end

    def self.params_name
      'calls'
    end
  end
end
