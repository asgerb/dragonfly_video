# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly_video/version'

Gem::Specification.new do |spec|
  spec.name          = "dragonfly_video"
  spec.version       = DragonflyVideo::VERSION
  spec.authors       = ["Asger Behncke Jacobsen"]
  spec.email         = ["asger@8kilo.com"]

  spec.summary       = 'Wraps common video-related tasks into Dragonfly analysers and processors.'
  spec.homepage      = 'https://github.com/asgerb/dragonfly_video'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'dragonfly', '~> 1.0'
  spec.add_dependency 'streamio-ffmpeg', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest'
end
