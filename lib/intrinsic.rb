require 'intrinsic/version'
require 'intrinsic/intrinsicism'
require 'intrinsic/extrinsicism'

module Intrinsic
  def self.included(subject)
    super
    subject.extend Intrinsicism
    subject.send :include, Intrinsicism
  end

  def initialize(values = {})
    @properties = {}.merge self.class.defaults
  end

  def to_s
    "#<#{self.class}:#{self.object_id} #{properties.map{|k,v| k.to_s + '=' + v.inspect}.join(', ')}>"
  end

end
