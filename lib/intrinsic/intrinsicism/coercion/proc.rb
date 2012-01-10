module Intrinsic
  module Intrinsicism
    module Coercion
      module Proc
        def self.convert(value)
          begin
            value.to_proc
          rescue
            raise TypeError
          end
        end
      end
    end
  end
end
