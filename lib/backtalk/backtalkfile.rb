require 'fileutils'
require 'rubygems/package'

module Backtalk

  class Backtalkfile

    def initialize(filename)
      @definition = Definition.new
      @definition.instance_eval(File.read(filename), filename)
    end

    def gem_spec
      gem_spec = @definition.as_gem_spec
      gem_spec.files = collect_sass_files.map! { |filename| "styles/#{filename}" } + %W(lib/#{@definition.gem_name}.rb)
      gem_spec
    end

    def prep_build(dest)
      collect_sass_files.each do | filename |
        output = File.join(dest, 'styles', filename)
        FileUtils.mkdir_p File.dirname(output)
        FileUtils.cp filename, output
      end
      add_loader dest
    end

    private

    def collect_sass_files
      Dir['**/*.scss']
    end

    def add_loader(dest)
      FileUtils.mkdir_p File.join(dest, 'lib')
      FileUtils.cp File.expand_path('sass_importer.rb', File.dirname(__FILE__)), File.join(dest, 'lib', "#{@definition.gem_name}.rb")
    end

  end

  class Backtalkfile::Definition

    attr_accessor :gem_name
    attr_writer :version
    attr_writer :authors

    def as_gem_spec
      Gem::Specification.new do |s|
        s.name = @gem_name
        s.version = @version
        s.authors = @authors
        s.summary = "Sass package #{@gem_name}"
      end
    end

    private

    def definition
      yield self
    end

  end

end
