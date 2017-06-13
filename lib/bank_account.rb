# Handles balance management
class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit_account(amount)
    @balance += amount
  end

  def debit_account(amount)
    @balance -= amount
  end
end
