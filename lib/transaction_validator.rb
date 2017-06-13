# confirms details provided are correct
class TransactionValidator
  def validate(amount, date)
    confirm_valid_date(date)
    confirm_valid_amount(amount)
  end

  private

  def confirm_valid_date(date)
    Date.strptime(date, '%d/%m/%Y')
  end

  def confirm_valid_amount(amount)
    raise 'amount provided is not valid' unless (amount.is_a? Numeric) && amount.positive?
  end
end
