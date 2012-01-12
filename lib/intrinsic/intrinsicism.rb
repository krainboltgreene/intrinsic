require_relative 'intrinsicism/coercion'
require_relative 'intrinsicism/validation'

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
        raise TypeError unless type.is_a? Class
        raise TypeError unless options.is_a? Hash
      end

      def property_block(name, type)
        ->(value = nil) do
          key = name.to_sym.freeze
          unless value.nil?
            @properties[key] = Coercion.convert value, type
            instance_variable_set :"@#{key}", value
            self
          else
            value = @properties[key]
            unless value.is_a? Proc
              value
            else
              value.call self
            end
          end
        end
      end
  end
end
