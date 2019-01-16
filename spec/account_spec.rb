# frozen_string_literal: true

require 'account'
describe Account do
  subject { described_class.new(transaction) }
  let(:transaction) { spy('transaction') }
  let(:default_balance) { Account::DEFAULT_AMOUNT }

  it 'can print initial account balance' do
    expect(subject.balance).to eq default_balance
  end

  describe '#deposit' do
    it 'balance changes with a deposit' do
      expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
    end

    it 'makes a new transaction with a deposit' do
      expect(transaction).to receive(:add_transaction).with(1000, 0, 1000)
      subject.deposit(1000)
    end
  end

  describe '#withdrawal' do
    it 'balance changes with a withdrawal' do
      expect { subject.withdrawal(500) }.to change { subject.balance }.by(-500)
    end

    it 'makes a new transaction with a withdrawal' do
      expect(transaction).to receive(:add_transaction).with(0, 500, -500)
      subject.withdrawal(500)
    end
  end
end
