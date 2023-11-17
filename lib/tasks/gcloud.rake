# frozen_string_literal: true
# typed: false

namespace :gcloud do
  desc 'Deploy to Google App Engine'

  task deploy: :environment do
    puts 'Clean assets'
    `RAILS_ENV=production bundle exec rake assets:clean && bundle exec rake assets:clobber`

    puts 'Build assets'
    `RAILS_ENV=production bundle exec rake assets:precompile`

    puts 'Deploy to Google AppEngine'
    opts = ''
    project_id = ENV.fetch('PROJECT_ID', nil)
    opts = "--project=#{project_id}" unless project_id.nil?

    cmd = "gcloud app deploy app.yaml -q #{opts}"

    puts "\nExecuting '#{cmd}'"
    system(cmd)
  end
end
