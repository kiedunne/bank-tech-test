# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }

  describe '#update_statement' do
    it 'can store amount withdrawn, balance, and date in a transaction' do
      account.withdrawal(50)
      expect(account.statement.flatten).to include(account.amount)
      expect(account.statement.flatten).to include(account.balance)
      expect(account.statement.flatten).to include(a_kind_of(Time))
    end

    it 'statement can store multiple transactions' do
      account.withdrawal(50)
      account.deposit(10)
      expect(account.statement.length).to eq(2)
    end
  end
end
