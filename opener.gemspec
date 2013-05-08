# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'opener'
  spec.version       = '0.1.0'
  spec.author        = 'Suraj N. Kurapati'
  spec.email         = 'sunaku@gmail.com'
  spec.description   = 'A 33-line alternative to the popular launchy library.'
  spec.summary       = 'Library for opening things in an cross-platform way.'
  spec.homepage      = 'https://github.com/sunaku/opener'
  spec.license       = 'Ruby'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end
