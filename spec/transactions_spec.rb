# frozen_string_literal: true

require 'account'
require 'transactions'

describe Transactions do
  let(:transactions) { described_class.new }

  describe '#add_transaction' do
    it 'adds transaction to transaction list' do
      transactions.add_transaction(1000, 0, 1000)
      expect(transactions.transactions).to include(transactions.transaction)
    end
  end

  it 'formats credits correctly' do
    transactions.add_transaction(1000, 0, 3000)
    expect(transactions.transaction).to include('1000.00')
    expect(transactions.transaction).to include('3000.00')
    expect(transactions.transaction).to include('0.00')
  end

  it 'formats debits correctly' do
    transactions.add_transaction(0, 500, 2500)
    expect(transactions.transaction).to include('500.00')
    expect(transactions.transaction).to include('0.00')
  end
end
