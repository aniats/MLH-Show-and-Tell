class Bridge
    def initialize
      puts "Bridge is built"
    end

    def open
        puts "Most is open, have a safe trip!"
    end
end


new_bridge = Bridge.new
new_bridge.open