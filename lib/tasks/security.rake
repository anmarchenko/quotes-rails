task security: :environment do
  sh "yarn audit && bundle exec bundle-audit check --update && bundle exec brakeman"
end
