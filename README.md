# Bank Tech Test

Written in Ruby using a TDD approach; meant to be accessed through a REPL such as IRB or PRY.

## Test Scope
'Given a client makes a deposit of 1000 on 10-01-2012 And a deposit of 2000 on 13-01-2012 And a withdrawal of 500 on 14-01-2012 When she prints her bank statement Then she would see:'

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```


### Demo:
```
$ ruby demo.rb
```
Running the above in the command line will generate the above bank statement by using the methods in the application.

### Considerations

WORK IN PROGRESS

The user can only input three commands via a Main class instance (do the following first $'WHATEVER YOU WANT' = Main.new):-

*deposit* and *withdraw* both require a valid amount and date to be entered.
Guard clauses included: Invalid Date or Amount (negative amount or non-numeric argument)

The BankAccount.rb's third public method *print_bank_statement* is there simply to make the command of outputting the bank statement simpler for the user.

### Limitations:

The application currently relies on the user previously inputting their deposits/withdrawals without jumping back and forth in time to print a correctly dated bank statement.
