# frozen_string_literal: true

require 'account'
require 'statement'

describe Statement do
  let(:account) { double :account, tran: [['14/01/2019', '|| 10.00', '20.00']] }
  let(:statement) { described_class.new(account.tran) }

  describe '#print_statement' do
    it 'can print statement with transactions' do
      expect(statement).to receive(:print_statement).and_return(account.tran)
      statement.print_statement
    end
  end
end
