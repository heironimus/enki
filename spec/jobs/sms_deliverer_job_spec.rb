require File.dirname(__FILE__) + '/../spec_helper'

RSpec.describe SmsDelivererJob, type: :job do
  let(:sms_client) { double("sms client") }
  let(:comment) { "my comment" }

  describe "perform" do
    it "delivers proper sms message" do
      allow(SmsClient).to receive(:new).and_return(sms_client)
      expect(sms_client).to receive(:deliver_message).with(comment)
      SmsDelivererJob.perform_now(comment)
    end
  end
end
