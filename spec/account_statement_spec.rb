# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }

  describe '#update_statement' do
    it 'can store amount withdrawn, balance, and date in a transaction' do
      account.withdrawal(500)
      expect(account.transactions.flatten).to include(account.amount)
      expect(account.transactions.flatten).to include('-500.00')
    end

    it 'statement can store multiple transactions' do
      account.deposit(1000)
      account.deposit(2000)
      account.withdrawal(500)
      expect(account.transactions.length).to eq(3)
    end
  end
end
