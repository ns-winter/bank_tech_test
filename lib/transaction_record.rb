# TransactionRecord - stores all transactions
class TransactionRecord
  attr_reader :history

  def initialize
    @history = []
  end

  def record_deposit(date, amount, balance)
    @history.push(date: date, credit: format('%.2f', amount),
                  debit: nil, balance: format('%.2f', balance))
  end

  def record_withdrawal(date, amount, balance)
    @history.push(date: date, credit: nil,
                  debit: format('%.2f', amount), balance: format('%.2f', balance))
  end
end
