module Camus
  class Kafka

    class << self

      def produce(topic, message)
        message = Array[ Poseidon::MessageToSend.new(topic, message) ]
        producer.send_messages(message)
      end

      private

      # This is single broker for now.  To upgrade: http://www.rubydoc.info/github/bpot/poseidon/Poseidon/Producer
      def producer
        @producer ||= Poseidon::Producer.new(locations, "Camus", type: :sync, compression_codec: :gzip)
      end

      def brokers
        Array[ ENV["KAFKA_BROKER"] || "192.168.59.103" ]
      end

      def ports
        Array[ ENV["KAFKA_PORT"] || "32782" ]
      end

      def locations
        brokers.zip(ports).map {|broker, port| "#{broker}:#{port}"}
      end
    end
  end
end