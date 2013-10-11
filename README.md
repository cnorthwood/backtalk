Backtalk
========

Backtalk makes sassy gems

Specifically, it turns a directory of .scss files into a Gem which can be deployed into the RubyGems
ecosystem, which allows for sharing and versioning of common code between projects.

Building a Gem
--------------

You need to make a Backtalkfile in the directory which you want to package. A Backtalkfile looks like this:

    definition do | d |
      d.gem_name = 'backtalktest'
      d.version = '0.0.1'
      d.authors = "BBC Knowledge & Learning <unified-place-developers@lists.forge.bbc.co.uk>"
    end

Once you've created that, then you'll end up with a .gem file in your current directory which you
can install and manage using the normal RubyGems ecosystem.

Using a Backtalk Gem in your project
------------------------------------

Presumably you have a Gemfile or something similar which installs Sass already, so you can add your
built Gem dependencies to there. Then all you need to do is require the generated gems in your scss
compilation process, e.g.,

    scss -r gelgrid knowlearn.scss:knowlearn.css

And any SCSS files in your Gem are now available by doing an @import as per usual!