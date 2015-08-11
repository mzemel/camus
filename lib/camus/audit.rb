module Camus
  class Audit

    attr_accessor :payload

    def initialize(payload)
      raise WrongAuditDataTypeError unless payload.is_a?(Hash)
      @payload = payload.symbolize_keys
      validate!
    end

    def validate!
      raise AuditGuidNotFoundError unless payload.keys.include?(:audit_guid)
      # other validations go in here
    end
  end
end
