$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trivial_tokens/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trivial_tokens"
  s.version     = TrivialTokens::VERSION
  s.authors     = ["Thomas Millward Wright"]
  s.email       = ["thomas@ttrmw.co.uk"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TrivialTokens."
  s.description = "TODO: Description of TrivialTokens."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-tokeninput-rails"
  s.add_development_dependency "sqlite3"
end
