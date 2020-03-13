class Waiter
    attr_accessor :name, :yoe

    @@all = []

    def initialize(name, yoe)
        @name = name
        @yoe = yoe
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
          meal.waiter == self
        end
    end

    def best_tipper
        i = 0 
        bt = nil
        Meal.all.each do |meal|
            if meal.tip > i
                i = meal.tip
                bt = meal.customer
            end
        end
        bt
    end


end