# TransactionRecord - stores all transactions
class TransactionRecord
  attr_reader :history

  def initialize
    @history = []
  end

  def record_deposit(date, amount, balance)
    @history.push(date: date, credit: amount,
                  debit: nil, balance: balance)
  end

  def record_withdrawal(date, amount, balance)
    @history.push(date: date, credit: nil,
                  debit: amount, balance: balance)
  end
end
