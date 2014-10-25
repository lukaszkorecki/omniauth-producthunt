# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/producthunt/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-producthunt'
  spec.version       = Omniauth::Producthunt::VERSION
  spec.authors       = ['Łukasz Korecki']
  spec.email         = ['lukasz@coffeesounds.com']
  spec.summary       = 'Omniauth strategy for Product hunt'
  spec.description   = ''
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
