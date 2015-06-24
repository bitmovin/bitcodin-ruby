require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/output/*_test.rb', 'test/bitcodin_api_payment_tests.rb', 'test/bitcodin_api_statistics_tests.rb', 'test/bitcodin_api_wallet_tests.rb']
  t.verbose = true
end

task :default => :test