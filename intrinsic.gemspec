# encoding: utf-8
require File.expand_path('../lib/intrinsic/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kurtis Rainbolt-Greene"]
  gem.email         = ["kurtisrainboltgreene@gmail.com"]
  gem.description   = "Intrinsic adds properties to your objects"
  gem.summary       = %q{
    Intrinsic adds properties to your objects
  }
  gem.homepage      = "http://krainboltgreene.github.com/intrinsic"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "intrinsic"
  gem.require_paths = ["lib"]
  gem.version       = Intrinsic::VERSION

  gem.add_development_dependency 'rake', '0.9.2.2'
  gem.add_development_dependency 'yard', '0.7.4'
end

