#!/usr/bin/env ruby

Dir["*/"].each do |dir|
  puts "Upgrading #{dir}..."
  Dir.chdir(dir) do
    `git checkout master`
    `git pull`
  end
end

Dir.chdir("js2-mode") do
  `make clean all`
end
