require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
    def initialize(sender,receiver,status = "pending",amount)
      @sender = sender
      @receiver = receiver
      @status = status
      @amount = amount
    end
    def valid?
      self.sender.valid? == self.receiver.valid?
    end
    def execute_transaction
      if sender.balance > @amount && sender.valid? == true && sender.status = "pending" && receiver.valid? == true  && receiver.status = "pending"
         sender.balance -= @amount
        receiver.balance += @amount
        self.status = "complete"
      else
      self.status = "rejected"
     return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if sender.balance > @amount && sender.valid? == false && sender.status = "pending" && receiver.valid? == false  && receiver.status = "pending"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end

  end

      

    
end
