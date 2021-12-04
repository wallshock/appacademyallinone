require './item'

class List
    attr_accessor :label
    attr_writer :items
    def initialize(label)
        @label = label
        @items = []
    end
    
    def label=(nlabel)
        @label = nlabel
    end

    def add_item(title,deadline,description="")
        begin
        @items << Item.new(title,deadline,description)
        rescue
            return false
        else
            return true
        end
    end

    def size
        @items.size
    end

    def valid_index?(n)
        (0...self.size).each do |i|
            return true if i == n 
        end
        return false
    end

    def swap(i1,i2)
        if @items[i1.to_i] != nil && @items[i2.to_i] != nil
            @items[i1.to_i], @items[i2.to_i] = @items[i2.to_i], @items[i1.to_i]
            return true
        else
            return false
        end
    end

    def [](i)
        if @items[i.to_i] != nil
            @items[i.to_i]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "-----------------------------------------------------------------"
        puts "                         #{@label.upcase}"
        puts "-----------------------------------------------------------------"
        puts "Index".ljust(10) + "| Item".ljust(20) + "| Deadline".ljust(23) + "| Status"
        puts "-----------------------------------------------------------------"
        @items.each_with_index do |item, i|
            puts "#{i}".ljust(10) + "| #{item.title}".ljust(20) + "| #{item.deadline}".ljust(23) + "| #{item.status}".upcase
        end
        puts "-----------------------------------------------------------------"
    end

    def print_full_item(n)
        puts "-----------------------------------------------------------------"
        puts "#{@items[n].title}".ljust(55) + "#{@items[n].deadline}"
        puts "#{@items[n].description}"
        puts "-----------------------------#{@items[n].status}----------------------------".upcase
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, ammount=1)
        count = 0
        indeks = idx.to_i
        while count < ammount.to_i
            if indeks > 0
                self.swap(indeks,indeks-1)
                indeks -= 1
                count += 1
            else
                return false
            end
        end
    end

    def toggle_item(n)
        @items[n.to_i].toggle
    end

    def remove_item(idx)
        if @items[idx.to_i] != nil
            @items.delete_at(idx.to_i)
            return true
        end
        return false
    end

    def down(idx, ammount=1)
        count = 0
        indeks = idx.to_i
        while count < ammount.to_i
            if -1 < indeks && indeks < @items.length
                self.swap(indeks,indeks+1)
                indeks += 1
                count += 1
            else
                return false
            end
        end
    end

    def purge
        while !@items.all? {|item| item.done == false}
        @items.each_with_index do |task,i|
            if task.done
                self.remove_item(i)
                break
            end
        end
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

end
