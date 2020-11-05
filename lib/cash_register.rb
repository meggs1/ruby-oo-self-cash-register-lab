require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times {items << title} #times iterates over integer
        self.last_item = price * quantity
    end

    def apply_discount
        if discount > 0
            @discount = @discount/100.to_f
            @total = @total - (@total * @discount)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total = self.total - self.last_item  
    end

end
