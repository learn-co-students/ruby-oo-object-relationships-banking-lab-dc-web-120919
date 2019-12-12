require "pry"

class Transfer
  
  attr_writer 
  attr_reader 
  attr_accessor :sender, :receiver, :amount, :status 

  def initialize(sender, receiver, amount)

    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount 
  end 

  def valid?

    if self.sender.valid? == true && self.receiver.valid? == true 
      return true 
    else 
      return false
    end 
  end 

  def rejected 
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end 

  def execute_transaction 
    #self.valid? #checks to see if both accounts are open

    if self.valid? == true && self.status == "pending" && (self.sender.balance >= self.amount) 
      
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      
      self.rejected 
    end 
  end 

  def reverse_transfer
    
    if self.valid? && (self.receiver.balance > self.amount) && self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
      
    else 
      
      self.rejected 
    end 
  end 


end

