require_relative "room"

class Hotel
    def initialize(name,hash)
        @name = name
        @rooms = {}
        hash.each do |roomname,capacity|
            @rooms[roomname] = Room.new(capacity)
        end
    end

    def name
        new = []
        @name.split.each do |word|
            new << word.capitalize
        end
        new.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.each do |k,v|
            return true if name == k
        end
        puts "sorry, room does not exist"
        return false    
    end

    def check_in(person, room)
        if room_exists?(room)
            if  @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each do |roomname, capacity|
            if @rooms[roomname].occupants.length < @rooms[roomname].capacity
            return true
            end
        end
        return false
    end

    def list_rooms
        @rooms.each do |roomname, capacity|
            puts roomname + ".*" + @rooms[roomname].available_space.to_s
        end
    end
end
