require "json"

#temp = []

raw = File.open("../data/tsi.src", "r")
#raw.each_line do |i|
#  temp << i.split(" ")
#end

puts "temp size=#{temp.size}"

output = {}
temp.each_with_index do |i , index|
  puts "temp[#{index}]"
  if i.size > 3
    tmp = []
    temp[index..-1].each do |j|
      if j[2..-1].join("") == i[2..-1].join("")
        tmp << j[0]
      end
    end
    output[i[2..-1].join("").chomp] = tmp 
    #puts "#{i[2..-1].join("").chomp} => #{output[i[2..-1].join("").chomp]}"
  else
    tmp = []
    temp[index..-1].each do |j|
      if j[2] == i[2]
        tmp << j[0]
      end
    end
    output[i[2].chomp] = tmp 
    #puts "#{i[2].chomp} => #{output[i[2].chomp]}"
  end
end

File.open("../data/tsi.json", "w") do |f|
  f.write(output.to_json) 
end
