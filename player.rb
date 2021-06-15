class Player
    attr_reader :name, :marker
    def initialize(name, marker)
        @name = name
        @marker = marker
    end

    def introduce
        puts "#{name}'s marker is #{marker}"
    end
end