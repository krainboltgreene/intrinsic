require 'intrinsic'

class Person
  include Intrinsic
  include Intrinsic::Intrinsicism::Validation

  property :name
  property :email
  property :age, Integer, default: 13

  validation_for :name do
    name.match /\w/
  end

  validation_for :age do
    (13..100).include? age
  end

  validation_for :email do
    email.count('@') == 1 and email.length < 256 and email.length > 5
  end
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
