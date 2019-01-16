# frozen_string_literal: true

require 'account'
require 'statement'

describe Statement do
  subject { described_class.new(account.tran) }
  let(:account) { double :account, tran: [['14/01/2019', '0.00', '500.00', '2500.00'],
                                        ['14/01/2019', '2000.00', '0.00', '3000.00'],
                                        ['14/01/2019', '1000.00', '0.00', '1000.00']] }
  let(:header) { Statement::HEADER }

  describe '#print_statement' do
    context 'when transactions exist' do
      it 'prints statement in correct format' do
        subject.statement
        subject.print_statement(account.tran)
        expect(subject.statement).not_to include('0.00')
        expect(subject.statement.length).to eq(3)
        expect(subject.statement).to eq(['14/01/2019 ||  || 500.00 || 2500.00',
                                        '14/01/2019 || 2000.00 ||  || 3000.00',
                                        '14/01/2019 || 1000.00 ||  || 1000.00'])
      end
    end
    
    context 'when no transactions exist' do
      it 'prints header' do
        expect(subject).to receive(:print_statement).and_return(header)
        subject.print_statement(account.tran)
      end
    end
  end
end
