# -*- encoding: utf-8 -*-
VERSION = "0.0.1"

Gem::Specification.new do |spec|
  spec.name          = "motion-pool"
  spec.version       = VERSION
  spec.authors       = ["Frédéric Mascaro"]
  spec.email         = ["frederic.mascaro@wo-oo.com"]
  spec.description   = %q{A pool for RubyMotion.}
  spec.summary       = %q{A pool for RubyMotion}
  spec.homepage      = "https://github.com/wooandoo/motion-pool"
  spec.license       = "BSD3"

  files = []
  files << 'README.md'
  files << 'LICENSE'
  files.concat(Dir.glob('lib/**/*.rb'))
  files.concat(Dir.glob('motion/**/*.rb'))
  
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
