require_relative 'intrinsicism/coercion'

module Intrinsic
  module Intrinsicism

    attr_reader :properties, :defaults

    def property(name, type = String, options = {})
      @properties ||= []
      @defaults ||= {}
      check_types_for name, type, options
      define_method name, property_block(name, type)
      @properties << name
      @defaults[name.to_sym] = options[:default]
    end

    private
      def check_types_for(name, type, options)
        raise TypeError unless name.is_a? Symbol
        raise TypeError unless Intrinsic.const_get(type.name.to_sym).is_a? Class
        raise TypeError unless options.is_a? Hash
      end

      def property_block(name, type)
        ->(value = nil) do
          unless value.nil?
            @properties[name.to_sym] = Coercion.const_get(type.name.to_sym).convert value
            self.instance_variable_set :"@#{name.to_sym}", value
          else
          end
        end
      end
  end
end
