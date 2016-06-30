require "json"

temp = [] of Array(String)

File.each_line("../data/tsi.src") do |line|
  temp << line.split(" ")
end


output = {} of String => Array(String)

temp.each_with_index do |line , index|
  puts "temp[#{index}]"
  if line.size > 3 && !output[line[2..-1].join("").chomp]?
    puts  line[2..-1].join(" ").chomp
    collect = [] of Array(Int32 | String) 
    temp[index..-1].each do |inner|
      if inner[2..-1].join("") == line[2..-1].join("") && line.size > 3
        item = [] of Int32 | String
        item << inner[0]
        item << inner[1].to_i
        collect << item
      end
    end
    collect.sort_by! do |item|
      -(item[1] as Int32)
    end
    to_output = [] of String
    collect.each{|i| to_output << (i[0] as String)}
    output[line[2..-1].join("").chomp] = to_output 

  elsif line.size == 3 && !output[line[2].chomp]?
    puts line[2].chomp
    collect = [] of Array(Int32 | String)
    temp[index..-1].each do |inner|
      if inner[2] == line[2] && line.size == 3
        item = [] of Int32 | String
        item << inner[0]
        item << inner[1].to_i
        collect << item
      end
    end
    collect.sort_by! do |item|
      -(item[1] as Int32)
    end
    to_output = [] of String
    collect.each{|i| to_output << (i[0] as String)}
    output[line[2].chomp] = to_output 
  end
end

File.write("../data/tsi.json", output.to_json) 
