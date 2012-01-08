module Intrinsic::Intrinsicism
  module Validation


    def self.included(subject)
      super
      subject.extend Validation
    end
  end
end
