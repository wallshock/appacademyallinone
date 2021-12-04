require "./item"
require "./list"


class TodoBoard
    attr_accessor :hash
    def initialize
        @hash = Hash.new(0)
    end

    def create_list(label)
       @hash[label] = List.new(label) 
    end

    def get_command

        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            self.create_list(args[0])
            return true
        when 'ls'
            @hash.each_key do |k|
                p k
            end
            return true
        when 'showall'
            @hash.each_key do |k|
                @hash[k].print
            end
            return true
        when 'mktodo'
            @hash[args[0]].add_item(*args[1..-1])
            return true
        when 'up'
            @hash[args[0]].up(*args[1..-1])
            return true
        when 'down'
            @hash[args[0]].down(*args[1..-1])
            return true
        when 'toggle'
            @hash[args[0]].toggle_item(args[1])
            return true
        when 'swap'
            @hash[args[0]].swap(*args[1..-1])
            return true
        when 'sort'
            @hash[args[0]].sort_by_date!
        when 'priority'
            @hash[args[0]].print_priority
        when 'print'
            if args[1] == nil
                @hash[args[0]].print
            else
                @hash[args[0]].print_full_item(args[1].to_i)
            end
        when 'remove'
            @hash[args[0]].remove_item(args[1])
        when 'purge'
            @hash[args[0]].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        stay = true
        while stay
            stay = self.get_command
        end
    end
end

my_board = TodoBoard.new
my_board.run