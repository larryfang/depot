require 'rake'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

#CI_REPORTS = './'

RSpec::Core::RakeTask.new(:all => ["ci:setup:rspec"]) do |t|
  t.pattern = './spec/**/*_spec.rb'
end
#desc "Generate HTML report for all specs"
#
#RSpec::Core::RakeTask.new(:hudsonspec) do |t|
#  t.rspec_path =["./spec/**/*_spec.rb"]
#  t.rspec_opts = ["--format", "html"]
#end