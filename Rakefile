$LOAD_PATH.unshift File.dirname(__FILE__)

Dir['tasks/**/*.rake'].each { |rake| load rake }

require 'bundler'
require "bundler/gem_tasks"
require "rake/testtask"

Bundler::GemHelper.install_tasks

task :console do
  require 'irb'
  require 'irb/completion'
  require 'faker' # You know what to do.
  ARGV.clear
  IRB.start
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb', 'test/**/*_test.rb']
end

task default: %w[test]
