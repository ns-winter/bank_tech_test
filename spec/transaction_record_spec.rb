require 'transaction_record'

describe TransactionRecord do
  subject = described_class.new
  first_record = { date: '12/06/2017', credit: '100.00', debit: nil, balance: '500.00' }
  second_record = { date: '13/06/2017', credit: nil, debit: '200.00', balance: '300.00' }

  describe '#history' do
    it 'starts with an empty record' do
      expect(subject.history).to eq([])
    end
  end

  describe '#record_deposit' do
    it 'records a deposit' do
      expect { subject.record_deposit('12/06/2017', 100, 500) }.to change { subject.history }.from([]).to([first_record])
    end
  end

  describe '#record_withdrawal' do
    it 'records a withdrawal' do
      expect { subject.record_withdrawal('13/06/2017', 200, 300) }.to change { subject.history }.from([first_record]).to([first_record, second_record])
    end
  end
end
