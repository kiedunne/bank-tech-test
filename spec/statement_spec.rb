# frozen_string_literal: true

require_relative './helpers/example_transactions.rb'
require_relative './helpers/example_statement.rb'
require 'account'
require 'statement'

describe Statement do
  subject { described_class.new(account.transaction) }
  let(:account) { double :account, transaction: example_transactions }
  let(:header) { Statement::HEADER }

  describe '#print_statement' do
    context 'when transactions exist' do
      it 'prints statement in correct format' do
        subject.statement
        subject.print_statement(account.transaction)
        expect(subject.statement).not_to include('0.00')
        expect(subject.statement.length).to eq(3)
        expect(subject.statement).to eq(example_statement)
      end
    end

    context 'when no transactions exist' do
      it 'prints header' do
        expect(subject).to receive(:print_statement).and_return(header)
        subject.print_statement(account.transaction)
      end
    end
  end
end
