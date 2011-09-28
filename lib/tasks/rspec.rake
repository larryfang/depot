require 'rake'
require 'rspec/core/rake_task'

desc "Generate HTML report for all specs"

RSpec::Core::RakeTask.new(:hudsonspec) do |t|
  t.rspec_opts = ["--format", "html> /specs.html", "--diff"]
end