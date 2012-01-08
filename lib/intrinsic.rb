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
  end

  def to_s
  end

end
