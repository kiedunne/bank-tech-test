# frozen_string_literal: true

require 'account'
describe Account do
  subject { described_class.new(transactions) }
  let(:transactions) { double :transactions }

  describe '#deposit' do
    it 'makes a new transaction with a deposit' do
      expect(transactions).to receive(:add_transaction).with(1000, 0, 1000)
      subject.deposit(1000)
    end

    it 'cannot deposit a non-integer value' do
      expect { subject.deposit('1000') }.to raise_error 'Not an integer.'
    end
  end

  describe '#withdrawal' do
    it 'cannot withdraw more funds than available' do
      expect { subject.withdrawal(500) }.to raise_error 'Not enough funds.'
    end

    it 'cannot withdraw a non-integer value' do
      expect { subject.withdrawal('500') }.to raise_error 'Not an integer.'
    end

    it 'makes a new transaction with a withdrawal' do
      expect(transactions).to receive(:add_transaction).twice
      subject.deposit(1000)
      subject.withdrawal(500)
    end
  end
end
