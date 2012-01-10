module Intrinsic
  module Intrinsicism
    module Coercion
      module Integer
        def self.convert(value)
          begin
            value.to_i
          rescue
            raise TypeError
          end
        end
      end
    end
  end
end
