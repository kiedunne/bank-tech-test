# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }
  let(:default_balance) { Account::DEFAULT_AMOUNT }

  it 'can print initial account balance' do
    expect(account.balance).to eq default_balance
  end

  describe '#deposit' do
    it 'balance changes with a deposit' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end
  end

  describe '#withdrawal' do
    it 'balance changes with a withdrawal' do
      expect { account.withdrawal(500) }.to change { account.balance }.by(-500)
    end
  end
end
