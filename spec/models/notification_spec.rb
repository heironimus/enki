require File.dirname(__FILE__) + '/../spec_helper'

describe Notification do
  describe "deliver_comment" do
    let(:sms_client) { double("sms client") }
    let(:comment) { "my comment" }

    before do
      allow(Notification).to receive(:sms_client).and_return(sms_client)
    end

    it "delivers sms message if enabled" do
      allow(Rails.configuration.x).to receive(:enable_sms).and_return(true)
      expect(sms_client).to receive(:deliver_message).with(comment)
      Notification.deliver_comment(comment)
    end

    it "does not deliver sms message if disabled" do
      allow(Rails.configuration.x).to receive(:enable_sms).and_return(false)
      expect(sms_client).not_to receive(:deliver_message).with(comment)
      Notification.deliver_comment(comment)
    end
  end
end
