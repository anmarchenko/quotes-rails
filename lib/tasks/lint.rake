task lint: :environment do
  sh "rubocop -A && standardrb --fix"
end
