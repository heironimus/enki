require File.dirname(__FILE__) + '/../spec_helper'

describe Notification do
  describe "deliver_comment" do
    it "exists" do
      Notification.deliver_comment("comment")
    end
  end
end
