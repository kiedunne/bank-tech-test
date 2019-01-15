# frozen_string_literal: true

require 'account'
require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new }

  describe '#add_transaction' do
    it 'adds transaction to transaction list' do
      transaction.add_transaction(1000, 0, 1000)
      expect(transaction.transactions).to include(transaction.transaction)
    end
  end

  it 'formats credits correctly' do
    transaction.add_transaction(1000, 0, 3000)
    expect(transaction.transaction).to include('1000.00')
    expect(transaction.transaction).to include('3000.00')
    expect(transaction.transaction).to include('0.00')
  end

  it 'formats debits correctly' do
    transaction.add_transaction(0, 500, 2500)
    expect(transaction.transaction).to include('500.00')
    expect(transaction.transaction).to include('0.00')
  end
end
