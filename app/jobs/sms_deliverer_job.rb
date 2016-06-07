class SmsDelivererJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    SmsClient.new.deliver_message(args[0])
  end
end
