module Intrinsic
  module Intrinsicism
    module Coercion
      module Hash
        def self.convert(value)
          case value
            when Hash then value
            when Array then Hash[*value.flatten]
            when Integer then raise TypeError
            when String then raise TypeError
          end
        end
      end
    end
  end
end
