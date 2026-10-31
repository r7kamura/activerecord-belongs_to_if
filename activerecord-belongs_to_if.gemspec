lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_record/belongs_to_if/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-belongs_to_if"
  spec.version       = ActiveRecord::BelongsToIf::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Allows you to manage preload condition by `:if` condition."
  spec.homepage      = "https://github.com/r7kamura/activerecord-belongs_to_if"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.0.0"
  spec.add_dependency "activesupport"
end
