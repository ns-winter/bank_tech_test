require 'date'
# BankAccount class
class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount, date)
    valid_transaction_test(amount, date)
    @balance += amount
    # @transaction_record.record_deposit(date, amount, @balance)
  end

  def withdraw(amount, date)
    valid_transaction_test(amount, date)
    @balance -= amount
    # @transaction_record.record_withdrawal(date, amount, @balance)
  end

  private

  def valid_transaction_test(amount, date)
    confirm_valid_date(date)
    confirm_valid_amount(amount)
  end

  def confirm_valid_date(date)
    Date.strptime(date, '%d/%m/%Y')
  end

  def confirm_valid_amount(amount)
    unless amount.is_a? Numeric
      raise 'amount provided is not valid'
    end
  end
end
