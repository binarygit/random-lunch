#!/usr/bin/ruby
require 'debug'

num = 0
path = "app/assets/images/memes/"
Dir.new(path).each_child do |file_name| 
  ext = file_name[file_name.index(".")..-1]
  new_name = path + "meme-#{num}#{ext}"
  file_name = path + file_name
  File.rename(file_name, new_name)  
  num += 1
end
