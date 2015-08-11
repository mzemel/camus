require 'spec_helper'
require 'securerandom'

describe "Audits" do
  context "communicate with Kafka" do
    it "and contain the correct payload" do
      payload = {
        audit_guid: SecureRandom.uuid,
        event: "User logged in",
        ip: "127.0.0.1"
      }
      expect(Camus::Kafka).to receive(:produce).with("audits", payload.to_json)
      Camus.audit(payload)
    end
  end
end