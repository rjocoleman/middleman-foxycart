# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'middleman-foxycart'
  s.version     = '0.1.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Robert Coleman']
  s.email       = ['github@robert.net.nz']
  s.homepage    = 'https://github.com/rjocoleman/middleman-foxycart'
  s.summary     = %q{FoxyCart helpers for Middleman static sites}
  s.description = %q{FoxyCart helpers for Middleman static sites}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'middleman-core', '>= 3.4.0'

  s.add_runtime_dependency 'foxycart_helpers', '~> 1.0'
end
