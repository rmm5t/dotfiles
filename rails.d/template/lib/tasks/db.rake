namespace :db do
  desc "Reset your database using your migrations for the current environment, then load dummy data."
  task :bounce => ["db:migrate:reset", "db:fixtures:load"]
end
