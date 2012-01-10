module Intrinsic
  module Intrinsicism
    module Coercion
      module Symbol
        def self.convert(value)
          begin
            value.to_sym
          rescue
            raise TypeError
          end
        end
      end
    end
  end
end
