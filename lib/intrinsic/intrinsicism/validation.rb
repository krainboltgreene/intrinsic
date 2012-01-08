module Intrinsic::Intrinsicism
  module Validation


    def self.included(subject)
      super
      subject.extend Validation
    end

    def validation_for(property, &block)
      check_for_property property
    end

      def check_for_property(property)
      end
  end
end
