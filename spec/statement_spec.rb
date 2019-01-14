# frozen_string_literal: true

require 'account'
require 'statement'

describe Statement do
  let(:account) { double :account, tran: [['14/01/2019', '|| 10.00', '20.00']] }
  let(:statement) { described_class.new(account.tran) }
  let(:header) { Statement::HEADER }

  describe '#print_statement' do
    it 'print statement receives transactions' do
      expect(statement).to receive(:print_statement).and_return(account.tran)
      statement.print_statement
    end

    it 'print statement receives header' do
      expect(statement).to receive(:print_statement).and_return(header)
      statement.print_statement
    end

    it 'print statement receives header' do
      expect(statement.print_statement).to eq(statement.statement)
    end
  end
end
