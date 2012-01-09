require_relative 'intrinsicism/coercion'
require_relative 'intrinsicism/validation'

# The Intrinsicism module contains all of the logic for properties, validations,
# and coercions. To be more abstract this is where all the object-focused code
# goes under this namespace.

module Intrinsic
  module Intrinsicism

    # The readers for @properties and @defaults are used to access both of
    # those maps. The @properties list is for detailing the properties attached
    # to the class. The @defaults map is a hash of the properties and their
    # default values.
    attr_reader :properties, :defaults

    # The property method gets assigned as a self method and instance method
    # to any modules, classes, or objects that include Intrinsic::Intrinsicism.
    #
    # It takes 1 required argument (name), and 2 option arguments (type and options).
    # The name paramter passed through determines the property name, while
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
            self
          else
            value = @properties[name.to_sym]
            unless value.is_a? Proc
              value
            else
              value.call(self)
            end
          end
        end
      end
  end
end
