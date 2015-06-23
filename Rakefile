require "bundler/gem_tasks"
require 'rake/testtask'
require 'coveralls/rake/task'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/bitcodin_api_input_tests.rb']
  t.verbose = true
end

task :default => :test