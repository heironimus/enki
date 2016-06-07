class Notification
  class << self

    def deliver_comment(comment)
      if enable_sms
        SmsDelivererJob.perform_later(comment)
      end
    end

  private

    def enable_sms
      Rails.configuration.x.enable_sms == true
    end
  end
end

