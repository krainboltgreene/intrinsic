module Intrinsic
  module Intrinsicism
    module Coercion
      module String
        def self.convert(value)
          begin
            value.to_s
          rescue
            raise TypeError
          end
        end
      end
    end
  end
end
