# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }

  describe '#update_statement' do
    it 'can store amount withdrawn, balance, and date in a transaction' do
      account.withdrawal(50)
      expect(account.transactions.flatten).to include(account.amount)
      expect(account.transactions.flatten).to include(account.balance)
      expect(account.transactions.flatten).to include(a_kind_of(Time))
    end

    it 'statement can store multiple transactions' do
      account.withdrawal(50)
      account.deposit(10)
      expect(account.transactions.length).to eq(2)
    end
  end

  describe '#print_statement' do
    it 'can print statement with many transactions' do
      account.withdrawal(50)
      account.deposit(10)
      account.print_statement
      expect(account.statement.to_s).to include('50')
      expect(account.statement.to_s).to include('10')
    end
  end
end
