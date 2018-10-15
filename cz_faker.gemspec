Gem::Specification.new do |s|
  s.name        = 'cz_faker'
  s.version     = '0.0.4'
  s.date        = '2018-10-15'
  s.summary     = "Czech Data Faker"
  s.description = "A simple faker for czech data items"
  s.authors     = ["Jindrich Skupa (@eMan)"]
  s.email       = 'jindrich.skupa@gmail.com'
  s.files       = Dir['lib/**/*']
  s.homepage    =
    'http://rubygems.org/gems/cz_faker'
  s.license       = 'MIT'
  s.add_development_dependency 'minitest', '~> 5.11', '>= 5.11.3'
  s.add_development_dependency 'minitest-reporters-json_reporter', '~> 1.0', '>= 1.0.0'
  s.add_development_dependency 'nexus', '~> 1.4', '>= 1.4.0'
  s.add_development_dependency 'rubocop', '~> 0.58', '>= 0.58.2'
  s.add_development_dependency 'simplecov', '~> 0.16', '>= 0.16.1'
  s.required_ruby_version = '>= 2.1'
  s.require_paths = ["lib"]
end
