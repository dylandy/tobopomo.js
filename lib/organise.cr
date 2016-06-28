require "json"

temp = [] of Array(String)

File.each_line("../data/tsi.src") do |i|
  temp << i.split(" ")
end


output = {} of String => Array(String) 
temp.each_with_index do |i , index|
  puts "temp[#{index}]"
  if i.size > 3 && !output[i[2..-1].join("").chomp]?
    tmp = [] of String 
    temp[index..-1].each do |j|
      if j[2..-1].join("") == i[2..-1].join("") && i.size > 3
        tmp << j[0]
      end
    end
    output[i[2..-1].join("").chomp] =  tmp
    #puts "#{i[2..-1].join("").chomp} => #{output[i[2..-1].join("").chomp]}"
  elsif i.size == 3 && !output[i[2].chomp]?
    tmp = [] of String 
    temp[index..-1].each do |j|
      if j[2] == i[2] && i == 3
        tmp << j[0]
      end
    end
    output[i[2].chomp] = tmp
    #puts "#{i[2].chomp} => #{output[i[2].chomp]}"
  end
end

File.write("../data/tsi.json", output.to_json) 
