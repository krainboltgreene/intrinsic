require 'intrinsic/version'
require 'intrinsic/intrinsicism'
require 'intrinsic/extrinsicism'

# The Intrinsic model is the gateway to all the sub models, and by including
# it into a model or class you gain all of the power of the library
module Intrinsic

  # Defines a hooks onto `include` so that the subject is also extended with the model
  # meaning that singleton and instance methods exist on the class and instance
  # of the class.
  def self.included(subject)
    # Make a call to the superclass original included method
    super
    # Extend the class with the model to get the singleton methods
    subject.extend Intrinsicism
    # Send the include method with the model as an argument
    # TODO: Find out if this is needed?
    subject.send :include, Intrinsicism
  end

  # Defines the initialize method that takes a hash and sets the properties
  # to those values. It also takes the defaults and assigns them to the properties.
  # TODO: Rename the parameter to something else, like `initial_properties`
  # TODO: Make sure all the keys are symbols, or at least turn them into symbols
  def initialize(values = {})
    # Create a new empty table for the properties, and then merge in the defaults
    # TODO: Make defaults a class variable
    @properties = {}.merge self.class.defaults
    # Check to make sure all of the given properties are within the acceptable list
    # TODO: Rename this method, it's terribly named
    # TODO: Move it above everything else, and in an if block to save CPU time
    check_properties_of values
    # Go over each property-value pair and send the value to the correct
    # property method
    values.each { |property, value| send property.to_sym, value }
    # Return the object for chaining purposes
    # TODO: Is this even needed?
    self
  end

  # Redefining the `to_s` method so that print out is prettier
  # TODO: Change object_id to the correct hash
  # TODO: Remove self from object_id
  def to_s
    "#<#{self.class}:#{self.object_id} #{properties.map{|k,v| k.to_s + '=' + v.inspect}.join(', ')}>"
  end

  private
    # Defining a method that makes sure all of the properties are within
    # the list of class properties
    # TODO: Look into expanding this to allow for "subclass with slightly different
    # attributes" situation
    # TODO: Rename the parameter like with initialize
    def check_properties_of(values)
      # Go over each key, and if it results in false raise an ArgumentError
      # TODO: Provide helpful raise message
      raise ArgumentError unless values.each_key.all? do |property|
        # Check to see if the property is included in the class property list
        # TODO: Raise properties into a class variable
        self.class.properties.include? property
      end
    end
end
