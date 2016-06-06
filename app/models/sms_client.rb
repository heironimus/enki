# simple wrapper of Twilio client with settings
class SmsClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def deliver_message(message)
    deliver_message_with_options(from: from_sms, to: to_sms, message: message)
  end

private

  def deliver_message_with_options(from:, to:, message:)
    client.messages.create(
      to: to,
      from: from,
      body: message
    )
  end

  def account_sid
    Rails.application.secrets.twilio_account_sid
  end

  def auth_token
    Rails.application.secrets.twilio_auth_token
  end

  def from_sms
    Enki::Config.from_sms
  end

  def to_sms
    Enki::Config.author_sms
  end
end
