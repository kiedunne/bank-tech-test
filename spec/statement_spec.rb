# frozen_string_literal: true

require 'account'
require 'statement'

describe Statement do
  let(:account) { double :account, tran: [['14/01/2019', '0.00', '500.00', '2500.00'],
                                          ['14/01/2019', '2000.00', '0.00', '3000.00'],
                                          ['14/01/2019', '1000.00', '0.00', '1000.00']] }
  let(:statement) { described_class.new(account.tran) }
  let(:header) { Statement::HEADER }

  describe '#remove_zeros' do
    it 'replaces zeros in transaction' do
      statement.remove_zeros(account.tran)
      expect(statement.statement).not_to include('0')
    end
  end

  describe '#format_transaction' do
    it 'reassembles each transaction' do
      statement.remove_zeros(account.tran)
      statement.format_transaction
      expect(statement.statement.length).to eq(3)
    end
  end

  describe '#format_statement' do
    it 'reassembles each transaction' do
      p statement.remove_zeros(account.tran)
      p statement.format_transaction
      p statement.format_statement
      expect(statement.statement.length).to eq(3)
    end
  end

  describe '#print_statement' do
    it 'prints statement in correct format' do
      statement.print_statement(account.tran)
      expect(statement.statement).to eq(['14/01/2019 ||  || 500.00 || 2500.00',
                                         '14/01/2019 || 2000.00 ||  || 3000.00',
                                         '14/01/2019 || 1000.00 ||  || 1000.00'])
    end

    it 'prints header' do
      expect(statement).to receive(:print_statement).and_return(header)
      statement.print_statement(account.tran)
    end
  end
end
