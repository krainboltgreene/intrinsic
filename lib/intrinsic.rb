require 'intrinsic/version'
require 'intrinsic/intrinsicism'
require 'intrinsic/extrinsicism'

# The Intrinsic model is the gateway to all the sub models, and by including
# it into a model or class you gain all of the power of the library
module Intrinsic
  def self.included(subject)
    super
    subject.extend Intrinsicism
    subject.send :include, Intrinsicism
  end

  def initialize(values = {})
    @properties = {}.merge self.class.defaults
    check_properties_of values
    values.each { |property, value| send property.to_sym, value }
    self
  end

  def to_s
    "#<#{self.class}:#{self.object_id} #{properties.map{|k,v| k.to_s + '=' + v.inspect}.join(', ')}>"
  end

  private
    def check_properties_of(values)
      raise ArgumentError unless values.each_key.all? do |property|
        self.class.properties.include? property
      end
    end
end
