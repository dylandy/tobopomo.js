#!/usr/bin/env ruby
require "json"

temp = []

raw = File.open("../data/tsi.src", "r")
raw.each_line do |line|
  temp << line.split(" ")
end

puts "temp size=#{temp.size}"

output = {}
temp.each_with_index do |line , index|
  puts "temp[#{index}]"
  if line.count > 3 && output[line[2..-1].join("")].nil?
    collect = []
    temp[index..-1].each do |j|
      if j[2..-1].join("") == line[2..-1].join("") && j.count > 3
        collect << j[0]
      end
    end
    output[line[2..-1].join("")] = collect 
  elsif line.count == 3 && outuput[line[2]].nil?
    collect = []
    temp[index..-1].each do |j|
      if j[2] == line[2] && j.count == 3
        collect << j[0]
      end
    end
    output[line[2]] = collect 
  end
end

File.open("../data/tsi.json", "w") do |f|
  f.write(output.to_json) 
end
