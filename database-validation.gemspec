# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'database_validation/version'

Gem::Specification.new do |spec|
  spec.name          = "database-validation"
  spec.version       = DatabaseValidation::VERSION
  spec.authors       = ["Agustin Anfuso"]
  spec.email         = ["anfusoagustin89@gmail.com"]
  spec.summary       = %q{Length limit validations through database for Rails.}
  spec.description   = %q{Simple way to add Active Record Validations to models and views through the limits established in your database.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
