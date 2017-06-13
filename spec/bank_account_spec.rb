require 'bank_account'

describe BankAccount do
  subject = described_class.new

  describe '#balance' do
    it 'has a balance' do
      expect(subject).to respond_to(:balance)
    end

    it 'starting balance is 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#credit_account' do
    it 'can credit the account by £100' do
      expect { subject.credit_account(100) }.to change { subject.balance }.by(100)
    end
  end

  describe '#debit_account' do
    it 'can debit the account £50' do
      subject.debit_account(100)
      expect { subject.debit_account(50) }.to change { subject.balance }.by(-50)
    end
  end
end
