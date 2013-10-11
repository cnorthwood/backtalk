require 'rubygems/builder'
require 'tmpdir'

require 'backtalk/backtalkfile'

module Backtalk

  def self.run!
    backtalkfile = Backtalkfile.new "Backtalkfile"
    Dir.mktmpdir do | dir |
      backtalkfile.prep_build dir
      gem = Gem::Builder.new backtalkfile.gem_spec
      output_file = File.basename(backtalkfile.gem_spec.cache_file)
      Dir.chdir dir do
        gem.build
      end
      FileUtils.cp(File.join(dir, output_file), output_file)
    end
  end

end