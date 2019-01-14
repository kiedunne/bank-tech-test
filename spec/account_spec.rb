# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }

  it 'can print initial account balance' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'can deposit money' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end
  end

  describe '#withdrawal' do
    it 'can withdrawal money' do
      expect { account.withdrawal(500) }.to change { account.balance }.by(-500)
    end
  end
end
