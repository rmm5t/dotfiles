#!/usr/bin/env ruby

# Inspired by http://errtheblog.com/posts/89-huba-huba

# This is idempotent, meaning you can run it over and over again without fear of
# breaking anything. Use it as an installer or to upgrade after merging from an
# upstream fork.

require "fileutils"

[
  [".",      File.expand_path("~"),         "."],
  ["config", File.expand_path("~/.config"), ""],
].each do |src_dir, dest_dir, prefix|
  FileUtils.mkdir_p dest_dir
  Dir.chdir(src_dir) do
    Dir["*"].each do |file|
      next if file =~ /\Ainstall/ || file =~ /\AREADME/ || file == "config"
      target = if file =~ /^[A-Z]/
                 File.join(dest_dir, file)
               else
                 File.join(dest_dir, "#{prefix}#{file}")
               end
      `ln -ns #{File.expand_path file} #{target}`
    end
  end
end

`git submodule sync`
`git submodule update --init --recursive`
