# frozen_string_literal: true

require_relative './helpers/example_transactions.rb'
require 'account'
describe Account do
  subject { described_class.new }

  describe '#deposit' do
    before do
      Timecop.freeze(Time.local(2019, 1, 16))
    end
    after do
      Timecop.return
    end

    it 'adds a transaction when a deposit is made' do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdrawal(500)
      expect(subject.transactions).to eq(example_transactions)
    end
  end
end
