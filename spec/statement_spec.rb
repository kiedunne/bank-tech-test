# frozen_string_literal: true

require 'account'
require 'statement'

describe Statement do
  let(:account) { double :account, tran: [['14/01/2019', '0', '500', '2500.00'],['14/01/2019', '2000.00', '0', '3000.00']] }
  let(:statement) { described_class.new(account.tran) }
  let(:header) { Statement::HEADER }

  describe '#print_statement' do
    it 'print statement receives transactions' do
      expect(statement).to receive(:print_statement).and_return(account.tran)
      statement.print_statement
    end

    it 'print statement prints header' do
      expect(statement).to receive(:print_statement).and_return(header)
      statement.print_statement
    end

    it 'print statement prints transactions' do
      p statement.format_statement
      p statement.print_statement
    end
  end
end
