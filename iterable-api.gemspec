# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iterable/version'

Gem::Specification.new do |spec|
  spec.name          = "iterable-api"
  spec.version       = Iterable::VERSION
  spec.authors       = ["Iterable" , "Revv", "Kyle Schutt"]
  spec.email         = ["info@revv.co"]

  spec.summary       = %q{Ruby Library for interactions with the Iterable API}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  
  spec.add_runtime_dependency("rest-client", '< 4.0', '>= 1.6.7')
  spec.add_runtime_dependency("json", '~> 1.8', '>= 1.8.1')
  spec.add_runtime_dependency('mime-types', '< 4.0', '>= 1.25.1')
  spec.add_runtime_dependency('hashie', '~> 3.5.6', '>= 3.5.6')
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
