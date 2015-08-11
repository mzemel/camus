require "camus/version"
require 'json'
require 'poseidon'

module Camus
  class << self

    def log(exception)
      queue = exception.is_a?(Exception) ? error_queue : audit_queue
      message = convert_to_json(exception)
      queue.push(message)
    end

    def payload(exception)
      @payload ||= {
        "class" => exception.class.name,
        "message" => exception.message,
        "stacktrace" => exception.backtrace.join(", ")
      }.to_json # To do: make these keys configurable and exposable for types incl. Audits, Errors, etc.
    end

    def audit(payload)
      audit = Camus::Audit.new(payload)
      
  end
end