module Intrinsic::Intrinsicism
  module Validation


    def self.included(subject)
      super
      subject.extend Validation
    end

    def validation_for(property, &block)
    end
  end
end
