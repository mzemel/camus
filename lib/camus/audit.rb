module Camus
  class Audit
    attr_accessor :payload

    def initialize(payload)
      @payload = payload
    end

    def validate!

    end

  end
end

=begin
What do we want out of an audit?

  1.  ability to reference an a file
  2.  free-form field
  3.  location of database