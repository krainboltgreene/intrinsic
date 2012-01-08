module Intrinsic
  module Intrinsicism

    attr_reader :properties, :defaults

    def property(name, type = String, options = {})
      @properties ||= []
      @defaults ||= {}
    end

  end
end
