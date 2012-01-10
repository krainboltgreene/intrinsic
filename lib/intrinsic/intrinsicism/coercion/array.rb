module Intrinsic
  module Intrinsicism
    module Coercion
      module Array
        def self.convert(value)
          begin
            value.to_a
          rescue
            raise TypeError
          end
        end
      end
    end
  end
end
