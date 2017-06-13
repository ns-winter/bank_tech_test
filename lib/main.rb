require 'date'
require_relative 'main'
require_relative 'bank_account'
require_relative 'statement_printer'
require_relative 'transaction_record'
require_relative 'transaction_validator'
# BankAccount - handles transactions
class Main

  def initialize
    @bank_account = BankAccount.new
    @transaction_record = TransactionRecord.new
    @statement_printer = StatementPrinter.new
    @transaction_validator = TransactionValidator.new
  end

  def deposit(amount, date)
    @transaction_validator.validate(amount, date)
    @bank_account.credit_account(amount)
    @transaction_record.record_deposit(date, amount, @bank_account.balance)
  end

  def withdraw(amount, date)
    @transaction_validator.validate(amount, date)
    @bank_account.debit_account(amount)
    @transaction_record.record_withdrawal(date, amount, @bank_account.balance)
  end

  def print_bank_statement
    @statement_printer.print_statement(@transaction_record.history)
  end

  private


end
