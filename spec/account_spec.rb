# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }

  it 'can print initial account balance' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'can deposit money' do
      expect { account.deposit(50) }.to change { account.balance }.by(50)
    end
  end

  describe '#withdrawal' do
    it 'can withdrawal money' do
      expect { account.withdrawal(50) }.to change { account.balance }.by(-50)
    end
  end

  describe '#update_statement' do
    it 'can store amount withdrawn, balance, and date in a transaction' do
      account.withdrawal(50)
      expect(account.statement.flatten).to include(account.amount)
      expect(account.statement.flatten).to include(account.balance)
      expect(account.statement.flatten).to include(a_kind_of(Time))
    end
  end
end
