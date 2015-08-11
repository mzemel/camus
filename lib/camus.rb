require "camus/version"
require "camus/kafka"
require "camus/audit"
require "camus/errors"
require 'json'
require 'poseidon'

module Camus

  class << self

    def audit(payload)
      audit = Camus::Audit.new(payload)
      Camus::Kafka.produce("audits", audit.payload.to_json)
    end
      
  end
end
