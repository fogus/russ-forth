# encoding: utf-8
require File.expand_path('../lib/dogestrings/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'dogestrings'
  gem.description = %q{Hardcore docstrings for Ruby.}
  gem.authors = ['Fogus']
  gem.email = ['me-at-fogus-dot-me']

  gem.version = Dogestrings::VERSION
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'http://github.com/fogus/dogestrings'
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if gem.respond_to? :required_rubygems_version=
  gem.summary = gem.description
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
end
