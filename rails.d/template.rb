# Inlining a bunch of file directives is a pain in the ass.  Just use an
# existing directory instead.
def directory(path, log_action = true)
  path = File.expand_path(path)
  log 'directory', path if log_action
  in_root do
    everything_including_dotfiles = "{.[!.]*,*}"
    sources = Dir.glob(File.join(path, everything_including_dotfiles))
    FileUtils.cp_r(sources, ".")
  end
end

# Rails should utilize better yaml conventions
def rewrite_database_yml
  app_name = nil
  in_root { app_name = File.basename(FileUtils.pwd) }
  gsub_file "config/database.yml.example", "APP_NAME", app_name
  run "cp config/database.yml.example config/database.yml"
end

unnecessary_files =
  [
   "public/index.html",
   "public/dispatch.*",
   "public/javascripts/*.js",
   "public/images/rails.png",
   "public/favicon.ico",
  ]

plugins =
  {
    "haml"             => "git://github.com/nex3/haml.git",
    "shoulda"          => "git://github.com/thoughtbot/shoulda.git",
    "factory_girl"     => "git://github.com/thoughtbot/factory_girl.git",
    "hoptoad_notifier" => "git://github.com/thoughtbot/hoptoad_notifier.git",
    "strip_attributes" => "git://github.com/rmm5t/strip_attributes.git",
    "sprockets-rails"  => "git://github.com/coderifous/sprockets-rails.git",
  }

test_environment_config = <<-FILE
config.gem "mocha"
config.gem "fakeweb"
require "factory_girl"
FILE

############################################################

unnecessary_files.each do |file|
  run "rm #{file}"
end

capify!

directory "~/.rails.d/template"

rewrite_database_yml

run "curl -L http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js > app/javascripts/jquery.js"

environment test_environment_config, :env => :test

git :init

plugins.each do |name, repos|
  plugin name, :git => repos, :submodule => true
end

git :submodule => :init
git :add => "."
git :commit => "-a -m 'Initial commit'"
