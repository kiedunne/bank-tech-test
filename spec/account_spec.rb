# frozen_string_literal: true

require 'account'
describe Account do
  subject { described_class.new(transactions) }
  let(:transactions) { Transactions.new }
  let(:default_balance) { Account::DEFAULT_AMOUNT }

  it 'can print initial account balance' do
    expect(subject.balance).to eq default_balance
  end

  describe '#deposit' do
    it 'balance changes with a deposit' do
      expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
    end

    it 'makes a new transaction with a deposit' do
      subject.deposit(1000)
      expect(transactions.transactions).to include(transactions.transaction)
    end
  end

  describe '#withdrawal' do
    it 'balance changes with a withdrawal' do
      expect { subject.withdrawal(500) }.to change { subject.balance }.by(-500)
    end

    it 'makes a new transaction with a withdrawal' do
      subject.withdrawal(500)
      expect(transactions.transactions).to include(transactions.transaction)
    end
  end
end
