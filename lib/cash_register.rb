class CashRegister
    attr_accessor :total, :items, :discount, :last_transaction
    def initialize(discount=nil)
        @total = 0.0
        @items = []
        @discount = discount
        @last_transaction = []
    end
    def add_item(title, price, quantity=1)
        quantity.times do
            @items.push(title)
        end
        @total += price * quantity
        @last_transaction.push([price, quantity])
    end
    def apply_discount
        if @discount
            @total -= @total * (@discount / 100.0)
            p "After the discount, the total comes to $#{@total.to_i}."
        else
            p "There is no discount to apply."
        end
    end
    def void_last_transaction
        if @items and @last_transaction
            @total -= @last_transaction[-1][0] * @last_transaction[-1][1]
            @items.pop(@last_transaction[-1][1])
            @last_transaction.pop
        end
    end
end
