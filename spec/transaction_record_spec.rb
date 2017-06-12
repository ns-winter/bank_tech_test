require 'transaction_record'

describe TransactionRecord do
  subject = described_class.new

  it 'starts with an empty record' do
    expect(subject.history).to eq([])
  end

  it 'records a deposit' do
    expect { subject.record_deposit('12/06/2017', 100, 500) }.to change {subject.history}.from([]).to([{:date=>"12/06/2017", :credit=>100, :debit=>nil, :balance=>500}])
  end
end
