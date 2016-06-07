require File.dirname(__FILE__) + '/../spec_helper'

describe Notification do
  describe "deliver_comment" do
    let(:comment) { "my comment" }

    it "delivers sms message if enabled" do
      allow(Rails.configuration.x).to receive(:enable_sms).and_return(true)
      expect(SmsDelivererJob).to receive(:perform_later).with(comment)
      Notification.deliver_comment(comment)
    end

    it "does not deliver sms message if disabled" do
      allow(Rails.configuration.x).to receive(:enable_sms).and_return(false)
      expect(SmsDelivererJob).not_to receive(:perform_later).with(comment)
      Notification.deliver_comment(comment)
    end
  end
end
