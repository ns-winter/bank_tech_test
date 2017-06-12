require 'date'
require_relative 'transaction_record'
require_relative 'statement_printer'
# BankAccount - handles transactions
class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
    @transaction_record = TransactionRecord.new
    @statement_printer = StatementPrinter.new
  end

  def deposit(amount, date)
    valid_transaction_test(amount, date)
    @balance += amount
    @transaction_record.record_deposit(date, amount, @balance)
  end

  def withdraw(amount, date)
    valid_transaction_test(amount, date)
    @balance -= amount
    @transaction_record.record_withdrawal(date, amount, @balance)
  end

  def print_bank_statement
    @statement_printer.print_statement(@transaction_record.history)
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
    raise 'amount provided is not valid' unless (amount.is_a? Numeric) && amount.positive?
  end
end
