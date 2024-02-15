require "rubycritic/rake_task"

RubyCritic::RakeTask.new do |task|
  task.name = "critic"

  task.paths = FileList["app/**/*.rb", "lib/**/*.rb"]
end
