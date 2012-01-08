require 'intrinsic'

class Person
  include Intrinsic
  include Intrinsic::Intrinsicism::Validation

  property :name
  property :email
  property :age, Integer, default: 13

  validation_for :name  { name.match /\w/ }
  validation_for :age   { (13..100).include? age }
  validation_for :email { email.count('@') == 1 and (5..256).include? email.length }
end


person = Person.new name: "Kurtis"
# => #<Person:2152879000 name="Kurtis", email=nil, age=13>

p person.name("Hurly Burly").age("34")
# => #<Person:2153464580 name="Hurly Burly", age=34>

p person.name
# => "Hurly Burly"

p person.is_valid?
# => false

p person.errors
# => ["email is not valid"]
