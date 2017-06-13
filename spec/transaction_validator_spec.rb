require 'transaction_validator'

describe TransactionValidator do
  subject = described_class.new

  describe '#validate' do
    it 'passes a valid transaction' do
      expect { subject.validate(100, '12/07/2017') }.not_to raise_error
    end
  end

  describe '#validate(confirm_valid_amount)' do
    it 'raises an error if given negative amount argument' do
      expect { subject.validate(-100, '12/07/2017') }.to raise_error 'amount provided is not valid'
    end

    it 'raises an error if given an incorrect date argument' do
      expect { subject.validate(100, 'bad date') }.to raise_error 'invalid date'
    end
  end

  describe '#validate(confirm_valid_date)' do
    it 'raises an error if given non-numeric amount argument' do
      expect { subject.validate('bad amount', '12/07/2017') }.to raise_error 'amount provided is not valid'
    end
  end
end
