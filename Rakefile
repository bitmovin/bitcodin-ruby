require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.name = "input"
  t.test_files = FileList['test/input/*_test.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.name = "jobs"
  t.test_files = FileList['test/jobs/*_test.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.name = "output"
  t.test_files = FileList['test/output/*_test.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.name = "profiles"
  t.test_files = FileList['test/profiles/*_test.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.name = "payment"
  t.test_files = FileList['test/bitcodin_api_payment_tests.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.name = "statistics"
  t.test_files = FileList['test/bitcodin_api_statistics_tests.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.name = "wallet"
  t.test_files = FileList['test/bitcodin_api_wallet_tests.rb']
  t.verbose = true
end

task :default => ["input", "profiles", "payment", "statistics", "jobs", "wallet"]