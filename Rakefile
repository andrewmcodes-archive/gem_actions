# frozen_string_literal: true

require "date"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new :spec

begin
  require "rubocop/rake_task"
  RuboCop::RakeTask.new
  RuboCop::RakeTask.new("rubocop:md") do |task|
    task.options << %w[-c .rubocop-md.yml]
  end
rescue LoadError
  task(:rubocop) {}
  task("rubocop:md") {}
end

desc "Run all checks and tests"
task default: :test

desc "Run all checks and tests"
task test: %w[rubocop rubocop:md spec]

desc "Fix RuboCop violations"
task fix: ["rubocop:auto_correct"]

task "prepare:changelog" do
  repo = "https://github.com/andrewmcodes/gem_actions"
  changelog = IO.readlines("CHANGELOG.md").map(&:chomp)
  entries = [
    "## [#{GemActions::VERSION}] - #{Date.today}",
    "[#{GemActions::VERSION}]: #{repo}/releases/tag/v#{GemActions::VERSION}",
    "[Unreleased]: #{repo}/compare/v#{GemActions::VERSION}...HEAD"
  ]
  unless entries.all? { |x| changelog.include? x }
    puts "\nAdd these to CHANGELOG.md:\n\n"
    puts entries.join("\n")
    puts "\n\n"
    abort "ERROR: CHANGELOG version entries needed"
  end
  puts "CHANGELOG looks good"
end

task "prepare:version" do
  if system("git show-ref --tags v#{GemActions::VERSION}")
    abort("ERROR: Tag already exists. Check version.rb")
  end
end

task "prepare:tag" do
  unless system("git tag -m 'Version #{GemActions::VERSION}' v#{GemActions::VERSION}")
    abort("ERROR: Unable to tag")
  end
end

desc "Prepare a gem release"
task "prepare:release": [
  "release:guard_clean", "test", "prepare:version", "prepare:changelog", "prepare:tag"
] do
  puts "Release tagged. To create release run:\n\n"
  puts "git push --follow-tags"
end

CLEAN.include "coverage"
