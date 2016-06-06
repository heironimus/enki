class Notification
  class << self

    def deliver_comment(comment)
      if enable_sms
        sms_client.deliver_message(comment)
      end
    end

  private

    def sms_client
      @@sms_client ||= SmsClient.new
    end

    def enable_sms
      Rails.configuration.x.enable_sms == true
    end
  end
end

