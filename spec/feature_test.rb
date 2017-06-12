# Runs through the application as per instructions and prints out bank statement on console.
require_relative '../lib/bank_account'
require_relative '../lib/statement_printer'
require_relative '../lib/transaction_record'

bank = BankAccount.new
bank.deposit(100, '21/01/2017')
bank.deposit(150, '22/01/2017')
bank.withdraw(50, '23/01/2017')
bank.print_bank_statement
