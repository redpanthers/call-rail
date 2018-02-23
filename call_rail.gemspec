
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "call_rail/version"

Gem::Specification.new do |spec|
  spec.name          = "call_rail"
  spec.version       = CallRail::VERSION
  spec.authors       = ["Aboobacker MK"]
  spec.email         = ["aboobackervyd@gmail.com"]

  spec.summary       = %q{CallRail API wrapper}
  spec.description   = %q{CallRail}
  spec.homepage      = "https://github.com/redpanthers/call-rail"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
