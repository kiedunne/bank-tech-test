# frozen_string_literal: true

require 'account'
require 'transactions'

describe Transactions do
  let(:subject) { described_class.new }

  describe '#add_transaction' do
    it 'adds transaction to transaction list' do
      subject.add_transaction(1000, 0, 1000)
      expect(subject.transactions).to include(subject.transaction)
    end
  end

  it 'formats credits correctly' do
    subject.add_transaction(1000, 0, 3000)
    expect(subject.transaction).to include('1000.00')
    expect(subject.transaction).to include('3000.00')
    expect(subject.transaction).to include('0.00')
  end

  it 'formats debits correctly' do
    subject.add_transaction(0, 500, 2500)
    expect(subject.transaction).to include('500.00')
    expect(subject.transaction).to include('0.00')
  end
end
