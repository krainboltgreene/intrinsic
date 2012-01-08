intrinsic
=========

The intrinsic gem is for giving your objects typed attributes, defaults, and validations.


usage
-----

Using the intrinsic library is pretty simple and it works much like [ActiveModel](https://github.com/rails/rails/tree/master/activemodel) or [Virtus](https://github.com/solnic/virtus).
The basic features are:

  - Getters & Setters for named properties (similar to `attr_accessor`)
  - Default values, both in regular and Proc (ie callable `lambda`) form
  - Easy API for dumping object attributes (similar to `ostruct`)
  - Type and Argument errors for incorrectly supplied properties
  - Type coercion for attributes, as well as easily defininable new types


In addition you get these cool features:

  - Validate your properties with simple boolean logic, no complex `Validator` classes!
  - Simple error messages when your validations don't work (basic strings for now)
  - Chainable syntax for property setting: `Person.new.name("Kurtis").age(24)`


**Alternatives**

You may have noticed some alternative gems out there!
This is great, because it gives you a keen eye on how to make intrinsic better.
Here's a list of what those alternatives are and why I think Intrinsic should exist:

  * *ActiveModel*
      - **Pro**: Extremely large community and support over intrinsic
      - Pro: Well tested, documented, and designed
      - Pro: Continually worked on by many
      - **Con**: Large and bulky, with far too many tools in the toolbox
      - Con: Always tied to Rails
      - Con: Complex inner workings for even simple things
All of these alternatives are worth looking into!


installing
----------

**Requirements**

1. Ruby MRI 1.9+
2. RubyGems 1.6+

Like any other gem, all you have to do is either use:

``` bash
$ gem install
```

Or add it to your `Gemfile`:

``` ruby
source :rubygems

gem "intrinsic", "1.0.3"
```

That's all you have to do.

**Testing**

To make sure you did everything right do the following:

``` ruby
ruby -e "p require 'intrinsic'"
true
```


issues & documentation
----------------------

* [Documentation](http://krainboltgreene.github.com/intrinsic/documentation)
* [Issues](https://github.com/krainboltgreene/intrinsic/issues)

We welcome any pull requests or commits that improve `intrinsic`.


changelog
---------

  - 1.0.3:
      * Adding helpful README and license, updating example script
  - 1.0.0: Initial release


contributing
------------

* **Fork** the repository
* **Clone the repository** locally, or **edit via Github**
* Create a **new branch** using the [Git Flow Standard](http://yakiloo.com/getting-started-git-flow/) conventions
* Commit **often** and **when important**
* **DO NOT CHANGE** ANY OF THESE (without making a new branch for *that* change):
  * `*.gemspec`
  * `Rakefile`
  * `.rvmrc`
  * `.gitignore`
  * Any part of the git history
* **Write tests** specifically for the changes you've made, if no test exist
* **Push** your feature or hotfix branch to Github.
* Make a **Pull Request**


Credits
-------

  - [Piotr Solnica](https://github.com/solnic) for starting [Virtus](https://github.com/solnic/virtus) and inspiring me to build my own version of the concept.
  - [Yehuda Katz](https://github.com/wycats) for pulling out [ActiveModel](https://github.com/rails/rails/tree/master/activemodel), thus inspiring me to work on my own.


License
-------

Copyright (c) 2011 Kurtis Rainbolt-Greene

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
