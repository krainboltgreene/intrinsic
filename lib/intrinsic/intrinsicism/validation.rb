module Intrinsic::Intrinsicism
  module Validation

    attr_reader :validators, :errors

    def self.included(subject)
      super
      subject.extend Validation
    end

    def validation_for(property, &block)
      check_for_property property
      add_validators property, block
    end

    def is_valid?(property = nil)
      self.class.validators.all? { |property, validator| validate property, validator }
    end

    def add_validators(property = nil, block = nil)
      @validators ||= {}
      @validators[property] = block
    end

    private
      def validate(property, validator)
        begin
          validation_result = instance_eval &validator
        rescue
          validation_result = false
        end

        unless validation_result
          @errors ||= []
          @errors << "#{property} is not valid"
        end
      end

      def check_for_property(property)
        raise TypeError unless properties.include? property
      end
  end
end
