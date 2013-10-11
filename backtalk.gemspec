Gem::Specification.new do |s|
  s.name        = 'backtalk'
  s.version     = '0.0.1'
  s.summary     = "Backtalk"
  s.description = "Making Sassy gems"
  s.authors     = ["Chris Northwood"]
  s.email       = 'chris.northwood@bbc.co.uk'
  s.executables << 'backtalk'
  s.files       = ["lib/backtalk.rb", "lib/backtalk/backtalkfile.rb", 'lib/backtalk/sass_importer.rb']
  s.add_runtime_dependency 'sass'
end