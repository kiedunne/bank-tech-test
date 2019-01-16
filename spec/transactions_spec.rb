# frozen_string_literal: true

require_relative './helpers/example_transactions.rb'
require 'account'
require 'transactions'
require 'timecop'

describe Transactions do
  let(:subject) { described_class.new }

  describe '#add_transaction' do
    before do
      Timecop.freeze(Time.local(2019, 1, 16))
    end
    after do
      Timecop.return
    end

    it 'adds transaction to transaction list' do
      subject.add_transaction(1000, 0, 1000)
      subject.add_transaction(2000, 0, 3000)
      subject.add_transaction(0, 500, 2500)
      expect(subject.transactions).to eq(example_transactions)
    end
  end
end
