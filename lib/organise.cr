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
    collect = [] of String 
    temp[index..-1].each do |inner|
      if inner[2..-1].join("") == line[2..-1].join("") && line.size > 3
        collect << inner[0]
      end
    end
    output[line[2..-1].join("").chomp] =  collect
  elsif line.size == 3 && !output[line[2].chomp]?
    puts line[2].chomp
    collect = [] of String 
    temp[index..-1].each do |inner|
      if inner[2] == line[2] && line.size == 3
        collect << inner[0]
      end
    end
    output[line[2].chomp] = collect
  end
end

File.write("../data/tsi.json", output.to_json) 
