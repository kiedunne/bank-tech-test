# frozen_string_literal: true

require 'account'
describe Account do
  subject { described_class.new(transactions) }
  let(:transactions) { spy 'transactions' }
  
  describe '#deposit' do
    it 'transaction balance changes when a deposit is made' do
      expect(transactions).to receive(:add_transaction).with(1000, 0, 1000)
      subject.deposit(1000)
    end

    it 'makes a new transaction with a deposit' do
      subject.deposit(1000)
      expect(transactions.transactions).to include(transactions.transaction)
    end
  end

  describe '#withdrawal' do
    it 'balance changes with a withdrawal' do
      expect(transactions).to receive(:add_transaction).with(0, 500, -500)
      subject.withdrawal(500)
    end

    it 'makes a new transaction with a withdrawal' do
      subject.withdrawal(500)
      expect(transactions.transactions).to include(transactions.transaction)
    end
  end
end
