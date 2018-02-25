require './lib/parser'

input_path = ARGV[0]
output_path = ARGV[1]

reader = File.open(input_path, 'r')
incoming_text = reader.read
reader.close

p = Parser.new

writer = File.open(output_path, 'w')
writer.write(p.parse(incoming_text))
writer.close

puts "Converted #{input_path} (#{6} lines) to #{output_path} (#{8} lines)"
