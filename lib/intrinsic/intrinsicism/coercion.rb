require_relative 'coercion/string'
require_relative 'coercion/integer'
require_relative 'coercion/symbol'
require_relative 'coercion/array'
require_relative 'coercion/hash'
require_relative 'coercion/proc'

module Intrinsic::Intrinsicism
  module Coercion
    def convert(value, type)
      # Upon recieving a value and type attempt to send a method containing
      # the type's class name with the value. An example would be trying to
      # convert "Alison" (a String) into a Symbol you'd call
      # `Coercion::String.to_symbol(value)`
      self.const_get(value.class).send :"to_#{type.class.downcase}", value
    end
  end
end
