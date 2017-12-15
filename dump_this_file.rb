def dump_this_file(filename = __FILE__ )

  File.readlines(filename).each do |line|
    puts line
  end
end
dump_this_file
