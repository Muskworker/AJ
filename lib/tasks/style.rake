namespace :style do
  require 'rubocop/rake_task'

  desc 'Run RuboCop for style checking'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.options = ['--rails', '--display-cop-names']
  end
end

task :style do
  Rake::Task['style:rubocop'].invoke
end

task default: :style
