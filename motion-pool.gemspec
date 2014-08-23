# -*- encoding: utf-8 -*-
VERSION = "0.0.1b"

Gem::Specification.new do |spec|
  spec.name          = "motion-pool"
  spec.version       = VERSION
  spec.authors       = ["Frédéric Mascaro"]
  spec.email         = ["frederic.mascaro@wo-oo.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = ""

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  files.concat(Dir.glob('motion/**/*.rb'))
  
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
