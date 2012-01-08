module Intrinsic::Intrinsicism
  module Validation


    def self.included(subject)
      super
      subject.extend Validation
    end

    def validation_for(property, &block)
      check_for_property property
      add_validators property, block
    end

    def add_validators(property = nil, block = nil)
      @validators ||= {}
      @validators[property] = block
    end
      def check_for_property(property)
        raise TypeError unless properties.include? property
      end
  end
end
