# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_mailer_config/version'

Gem::Specification.new do |spec|
  spec.name          = "action_mailer_config"
  spec.version       = ActionMailerConfig::VERSION
  spec.authors       = ["labocho"]
  spec.email         = ["labocho@penguinlab.jp"]
  spec.summary       = %q{Load ActionMailer configuration from YAML}
  spec.description   = %q{Load ActionMailer configuration from YAML}
  spec.homepage      = "https://github.com/labocho/action_mailer_config"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "actionmailer", ">= 3"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.10"
  spec.add_development_dependency "letter_opener"
end
