# frozen_string_literal: true

require_relative './helpers/example_single_transaction.rb'
require 'account'
require 'transaction'
require 'timecop'

describe Transaction do
  let(:subject) { described_class.new(1000, 0, 1000) }

  describe '#add_transaction' do
    before do
      Timecop.freeze(Time.local(2019, 1, 16))
    end
    after do
      Timecop.return
    end

    it 'has time, credit, debit and balance values' do
      expect(subject.transaction.length).to eq(4)
      expect(subject.transaction).to eq(example_single_transaction)
    end
  end
end
