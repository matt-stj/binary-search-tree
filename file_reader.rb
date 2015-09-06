File.open("file.txt", "r").each_line do |line|
  # name: "Angela"    job: "Writer"    ...
  data = line.split(/\t/)
  name, job = data.map{|d| d.split(": ")[1] }.flatten
end
