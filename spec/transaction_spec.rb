# frozen_string_literal: true

require 'account'
require 'statement'
require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new('14/01/2019', '|| 10.00', '20.00') }

  it 'creates a transaction with a time, amount and balance' do
    expect(transaction.time).to eq('14/01/2019')
    expect(transaction.amount).to eq('|| 10.00')
    expect(transaction.balance).to eq('20.00')
  end
end
