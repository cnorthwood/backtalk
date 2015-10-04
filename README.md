Backtalk
========

Backtalk makes Sassy gems.

Specifically, it turns a directory of .scss files into a Gem which can be deployed into the RubyGems
ecosystem, which allows for sharing and versioning of common code (e.g., page furniture, grid systems)
between projects.

Backtalk can be useful if you don't want to introduce another package management tool into a
buildchain where you're already running a Ruby-based project.

To install Backtalk, simply run: `gem install backtalk`.

Building a Gem
--------------

You need to make a Backtalkfile in the directory which you want to package. A Backtalkfile looks like this:

    definition do | d |
      d.gem_name = 'backtalktest'
      d.version = '0.0.1'
      d.authors = "Mick E Mouse <memouse@largeenterprise.com>"
    end

You can then add .scss files to the same directory as this file, or nested below it. Any file ending *.scss
will be packaged into the gem.

To create the gem, run `backtalk`, and a .gem file is output.

You'll end up with a .gem file in your current directory which you can install and manage using the normal
RubyGems ecosystem (e.g., internal repositories or publish to RubyGems, etc).
 
You can try this by checking out this repo, installing backtalk and running it in the example directory.

Using a Backtalk Gem in your project
------------------------------------

Presumably you have a Gemfile or something similar which installs Sass already, so you can add your
built Gem dependencies to there. Then all you need to do is require the generated gems in your scss
compilation process. For example, if you've made a Gem called 'my-grid'

    scss -r my-grid myproduct.scss:myproduct.css

If you're using compass, you can add `require 'my-grid'` to your compass config file. Now any files
that you packaged in the above gem are available by adding `@import 'my-grid/filename.scss'` to your Sass.
