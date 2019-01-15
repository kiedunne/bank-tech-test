# frozen_string_literal: true

require 'account'
require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new(1000, 0, 3000) }
  let(:another_transaction) { described_class.new(0, 2000, 1000) }

  it 'creates a transaction containing fromatted credit, debit and balance' do
    expect(transaction.transaction.length).to eq(3)
    expect(transaction.transaction).to include('1000.00')
    expect(transaction.transaction).to include('0.00')
    expect(transaction.transaction).to include('3000.00')
  end

  describe '#add_transaction' do
    it 'adds transaction to transaction list' do
      transaction.add_transaction
      expect(transaction.transactions).to include(transaction.transaction)
    end
  end

  it 'formats credits correctly' do
    transaction.add_transaction
    expect(transaction.transaction).to include('1000.00')
    expect(transaction.transaction).to include('3000.00')
  end

  it 'formats debits correctly' do
    another_transaction.add_transaction
    expect(another_transaction.transaction).to include('2000.00')
    expect(another_transaction.transaction).to include('1000.00')
  end
end
