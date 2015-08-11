module Kafka
  module Errors

    class KafkaError < StandardError
      def message
        raise "Not Implemented"
      end
    end

    class WrongAuditDataTypeError < KafkaError
      def message
        "You must supply a Hash to this service"
      end
    end

    class AuditGuidNotFoundError < KafkaError
      def message
        "You have not supplied a GUID for this audit"
      end
    end
  end
end
