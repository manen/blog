# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "blog.manen.me"
  spec.version       = "1.0.0"
  spec.authors       = ["manen"]
  spec.email         = ["varga.bercel.i@gmail.com"]

  spec.summary       = "Uhhhh"
  spec.homepage      = "https://manen.me"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
end
