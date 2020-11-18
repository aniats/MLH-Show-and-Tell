def main
    puts 'I am working!'
    puts "My arguments are: #{ARGV}"
    # See them like Ruby sees them.
    p ARGV
end
  
# Keep it in the bottom of the file
if __FILE__ == $0
    main
end