# frozen_string_literal: true

$:.push File.expand_path('../lib', __FILE__)

require 'gtm_rails/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'gtm_rails'
  s.summary = 'Simply embed Google Tag Manager container snippet into Rails application'
  s.description = 'Simply embed Google Tag Manager container snippet into Rails application'

  s.version = GtmRails::VERSION

  s.license = 'MIT'

  s.authors = ['Koichi ITO']
  s.email = 'koic.ito@gmail.com'
  s.homepage = 'http://github.com/koic/gtm_rails'

  s.files = Dir[
    'README.md',
    'lib/**/*',
    'LICENSE'
  ]
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.2.2'

  s.add_dependency('rails', '>= 4.1.0')

  s.add_development_dependency('rspec-rails', '>= 3.0.0')
  s.add_development_dependency('sqlite3')
end
