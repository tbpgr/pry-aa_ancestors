# PryAaAncestors

PryAaAncestors is :link:[pry](https://github.com/pry/pry) plugin.
Show the class hierarchy that is ascii-art format.

~~~
% pry
[1] pry(main)> require 'prime'
=> true
[2] pry(main)> aa_ancestors Prime
-----------------
|  BasicObject  |
-----------------
       |
-----------------
|    Kernel     |
-----------------
       |
-----------------
|PP::ObjectMixin|
-----------------
       |
-----------------
|    Object     |
-----------------
       |
-----------------
|  Enumerable   |
-----------------
       |
-----------------
|     Prime     |
-----------------
~~~

## :cloud::arrow_down: Installation

Add this line to your application's Gemfile:

```ruby
gem 'pry-aa_ancestors'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pry-aa_ancestors

## :scroll: Usage
### :ballot_box_with_check: Confirm Installation

~~~
$ pry --plugins
Installed Plugins:
--
aa_ancestors      Show the class hierarchy that is Ascii-Art format.
~~~

### :closed_book: Help
~~~bash
$ pry
[1] pry(main)> help aa_ancestors
Show the class hierarchy that is Ascii-Art format.
    -h, --help      Show this message.
~~~

### :older_man::man::boy::baby: Standard class ( String ) hierarchy
~~~bash
$ pry
[2] pry(main)> aa_ancestors String
-----------------
|  BasicObject  |
-----------------
       |
-----------------
|    Kernel     |
-----------------
       |
-----------------
|PP::ObjectMixin|
-----------------
       |
-----------------
|    Object     |
-----------------
       |
-----------------
|  Comparable   |
-----------------
       |
-----------------
|    String     |
-----------------
~~~

### :older_woman::woman::girl::baby: User defined class ( Child ) hierarchy

~~~bash
$ pry
[1] pry(main)> module Extendable
[1] pry(main)* end
=> nil
[2] pry(main)> class Parent
[2] pry(main)* end  d
=> nil
[3] pry(main)> class Child < Parent
[3] pry(main)*   include Extendable
[3] pry(main)* end  d
=> Child
[4] pry(main)> aa_ancestors Child
-----------------
|  BasicObject  |
-----------------
       |
-----------------
|    Kernel     |
-----------------
       |
-----------------
|PP::ObjectMixin|
-----------------
       |
-----------------
|    Object     |
-----------------
       |
-----------------
|    Parent     |
-----------------
       |
-----------------
|  Extendable   |
-----------------
       |
-----------------
|     Child     |
-----------------
~~~

## :two_men_holding_hands: Contributing :two_women_holding_hands:

1. Fork it ( https://github.com/tbpgr/pry-aa_ancestors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
