require 'transaction_record'

describe TransactionRecord do
  subject = described_class.new

  it 'starts with an empty record' do
    expect(subject.history).to eq([])
  end

  it 'records a deposit' do
    expect { subject.record_deposit('12/06/2017', 100, 500) }.to change { subject.history }.from([]).to([{ date: '12/06/2017', credit: 100, debit: nil, balance: 500 }])
  end

  it 'records a withdrawal' do
    expect { subject.record_withdrawal('13/06/2017', 200, 300) }.to change { subject.history }.from([{ date: '12/06/2017', credit: 100, debit: nil, balance: 500 }]).to([{ date: '12/06/2017', credit: 100, debit: nil, balance: 500 }, { date: '13/06/2017', credit: nil, debit: 200, balance: 300 }])
  end
end
