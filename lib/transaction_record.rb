class TransactionRecord
  attr_reader :history

  def initialize
    @history = []
  end

  def record_deposit(date, amount, balance)
    @history.push({ date: date, credit: amount, 
      debit: nil, balance:balance })
    end

  end
