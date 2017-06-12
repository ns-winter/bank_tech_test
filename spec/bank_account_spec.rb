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
    expect { subject.deposit(100) }.to change { subject.balance }.by(100)
  end
end
