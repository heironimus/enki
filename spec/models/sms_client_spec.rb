require File.dirname(__FILE__) + '/../spec_helper'

describe SmsClient do
  describe "new" do
    it "creates a Twilio REST Client" do
      expect(Twilio::REST::Client).to receive(:new)
      SmsClient.new
    end
  end

  describe "deliver_message" do
    it "delivers message to and from proper numbers" do
      client = SmsClient.new
      expect(client).to receive(:deliver_message_with_options).
        with(from: Enki::Config.from_sms,
             to: Enki::Config.author_sms,
             message: "my message"
            )
      client.deliver_message("my message")
    end

  end
end
