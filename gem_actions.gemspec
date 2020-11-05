# frozen_string_literal: true

require_relative "lib/gem_actions/version"

Gem::Specification.new do |s|
  s.name = "gem_actions"
  s.version = GemActions::VERSION
  s.authors = ["Andrew Mason"]
  s.email = ["andrewmcodes@protonmail.com"]
  s.homepage = "https://github.com/andrewmcodes/gem_actions"
  s.summary = "Examples of GitHub Actions for a Ruby gem"
  s.description = "GitHub Action workflows for your Ruby gem"

  s.metadata = {
    "bug_tracker_uri" => "#{s.homepage}issues",
    "changelog_uri" => "#{s.homepage}/blob/main/CHANGELOG.md",
    "documentation_uri" => s.homepage,
    "homepage_uri" => s.homepage,
    "source_code_uri" => s.homepage
  }

  s.license = "MIT"

  s.files = Dir.glob("lib/**/*") + Dir.glob("bin/**/*") + %w[README.md LICENSE.txt CHANGELOG.md]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.5"

  s.add_development_dependency "bundler", ">= 1.15"
  s.add_development_dependency "rake", ">= 13.0"
  s.add_development_dependency "rspec", "~> 3.9"
end
