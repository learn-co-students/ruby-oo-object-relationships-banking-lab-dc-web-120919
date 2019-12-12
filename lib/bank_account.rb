require "pry"

class BankAccount

    attr_reader :name 
    attr_accessor :balance, :status 

    def initialize(name)

        @name = name
        @balance = 1000
        @status = "open"

    end 

    def deposit(amount)

        return self.balance += amount 
    end 

    def display_balance

        return "Your balance is $#{self.balance}."
    end 

    def valid?

        if self.balance > 0 && self.status == "open"
            return true
        else
            return false 
        end 
    end 

    def close_account 

        return self.status = "closed"
    end 
end
