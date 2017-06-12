require 'bank_account'

describe BankAccount do
  subject = described_class.new

  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'starting balance is 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can deposit £100' do
    expect { subject.deposit(100, '12/07/2017') }.to change { subject.balance }.by(100)
  end

  it 'can withdraw £50' do
    subject.deposit(100, '12/07/2017')
    expect { subject.withdraw(50, '12/07/2017') }.to change { subject.balance }.by(-50)
  end

  it 'raises an error if given incorrect amount argument' do
    expect { subject.deposit('bad amount', '12/07/2017') }.to raise_error 'amount provided is not valid'
  end

  it 'raises an error if given an incorrect date argument' do
    expect { subject.withdraw(100, 'bad date') }.to raise_error 'invalid date'
  end
end
