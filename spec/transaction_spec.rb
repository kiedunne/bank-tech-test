# frozen_string_literal: true

require 'account'
require 'statement'
require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new('14/01/2019', '|| 10.00', '20.00') }

  it 'sets transaction time, amount and balance' do
    expect(transaction.time).to eq('14/01/2019')
    expect(transaction.amount).to eq('|| 10.00')
    expect(transaction.balance).to eq('20.00')
  end

  it 'creates a transaction containing amount and balance' do
    expect(transaction.transaction.length).to eq(3)
    expect(transaction.transaction).to include(transaction.time)
    expect(transaction.transaction).to include(transaction.amount)
    expect(transaction.transaction).to include(transaction.balance)
  end

  describe '#add_transaction' do
    it 'adds transaction to transaction list' do
      transaction.add_transaction
      expect(transaction.transactions).to include(transaction.transaction)
    end
  end
end
