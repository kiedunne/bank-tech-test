# frozen_string_literal: true

require_relative './helpers/example_transactions.rb'
require_relative './helpers/example_statement.rb'
require 'timecop'
require 'statement'

describe Statement do
  subject { described_class.new }
  let(:header) { Statement::HEADER }

  describe '#print_statement' do
    before do
      Timecop.freeze(Time.local(2019, 1, 16))
    end
    after do
      Timecop.return
    end

    context 'when transactions exist' do
      it 'prints statement in correct format' do
        expect(subject.print_statement(ex_transactions)).to eq(ex_statement)
      end
    end

    context 'when no transactions exist' do
      it 'prints header' do
        expect(subject).to receive(:print_statement).and_return(header)
        subject.print_statement(ex_transactions)
      end
    end
  end
end
