set :application,  "APPLICATION"  #FIXME
set :scm,          "git"
set :repository,   "git@github.com:USERNAME/PROJECT.git" #FIXME
set :branch,       "master"
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
# set :deploy_to,    "/u/apps/\#{application}"
set :use_sudo,     false
set :runner,       "deploy"
set :admin_runner, "deploy"

server "app@SERVER.com:2222", :web, :app, :db, :primary => true  #FIXME

after "deploy:update_code", "deploy:symlink_configs"
after 'deploy:update_code' do
  rails_env = fetch(:rails_env, "production")
  run "\#{release_path}/script/runner -e \#{rails_env} 'Sass::Plugin.update_stylesheets'"
end

after "deploy", "deploy:cleanup"
after "deploy:long", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"

# after "deploy" do campfire_deploy_message end
# after "deploy:migrations" do campfire_deploy_message(:migrations => true) end
# after "deploy:long" do campfire_deploy_message(:migrations => true) end

namespace :deploy do
  desc "Long deploy will throw up the maintenance.html page and run migrations then it restarts and enables the site again."
  task :long do
    transaction do
      update_code
      web.disable
      symlink
      migrate
    end

    restart
    web.enable
  end

  task :symlink_configs, :roles => :app, :except => {:no_symlink => true} do
    run <<-CMD
      ln -nfs \#{shared_path}/config/database.yml \#{release_path}/config/database.yml
    CMD
  end

  desc "Tail the Rails log for this environment"
  task :logs, :roles => :app do
    rails_env = fetch(:rails_env, "production")
    run "tail -f \#{shared_path}/log/\#{rails_env}.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "\#{channel[:host]}: \#{data}"
      break if stream == :err
    end
  end

  desc "Restart the app server."
  task :restart, :roles => :app do
    run "touch \#{current_path}/tmp/restart.txt"
  end
end

def campfire_deploy_message(options = { })
  message = "[capistrano] \#{ENV['USER']} deployed branch \#{revision} to production"
  message << " and ran migrations" if options[:migrations]
  campfire_bot message
end

def campfire_bot(message)
  require 'tinder'
  campfire = Tinder::Campfire.new "SUBDOMAIN" #FIXME
  campfire.login "campfire@SERVER.com", "PASSWORD"  #FIXME
  room = campfire.find_room_by_name "ROOM" #FIXME
  room.speak message
end
