require 'minitest/autorun'
require 'intrinsic'


class BasicPerson
  include Intrinsic

  property :name, String
  property :email, String
  property :age, Integer, default: 13
end

class EmbeddedPerson
  include Intrinsic

  property :name, String
  property :email, String
  property :age, Integer, default: 13

  embeds :skills { |skill|
    skill.property :name
    skill.property :rank, Integer, default: 0 }
end

class ValidPerson
  include Intrinsic

  property :name, String
  property :email, String
  property :age, Integer, default: 13

  validation_for :name { |name| !name.blank? && name.match =~ /\w+|\,+|\.+|\-+|\s+/ }
  validation_for :email { |email| !email.blank? }
  validation_for :age { |age| (13..90).include? age }
end
