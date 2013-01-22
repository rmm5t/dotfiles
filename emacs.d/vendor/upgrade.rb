#!/usr/bin/env ruby

Dir["*/"].each do |dir|
  puts "\nUpgrading #{dir}..."
  Dir.chdir(dir) do
    `git checkout master`
    `git pull`
    `git submodule update --init --recursive`
  end
end

Dir.chdir("js2-mode") do
  `make clean all`
end
