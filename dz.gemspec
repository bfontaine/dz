lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dz'

Gem::Specification.new do |s|
    s.name          = 'dz'
    s.version       = DZ.version
    s.date          = Time.now

    s.summary       = 'Dead simple hex-to-binary CLI tool'
    s.description   = 'Convert lists of hexadecimal numbers into binary files'
    s.license       = 'MIT'

    s.author        = 'Baptiste Fontaine'
    s.email         = 'b@ptistefontaine.fr'
    s.homepage      = 'https://github.com/bfontaine/dz'

    s.files         = %w(LICENCE README.md dz.gemspec)
    s.files        += Dir.glob('lib/**/*.rb')

    s.test_files    = Dir.glob('tests/**/*')
    s.require_path  = 'lib'

    s.bindir        = 'bin'
    s.executables  << 'dz'

    s.add_development_dependency 'simplecov'
    s.add_development_dependency 'rake'
    s.add_development_dependency 'test-unit'
end
