# frozen_string_literal: true

require 'account'
require 'statement'
require 'transaction'

describe 'Feature: Make multiple transactions and see statement' do
  let(:account) { Account.new }
  let(:statement) { Statement.new(account.transaction) }

  it 'A user can make multiple withdrawals and deposits and see statement' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdrawal(500)
    a = statement.transactions.transactions
    statement.print_statement(a)
    expect(statement.statement).to eq(['15/01/2019 ||  || 500.00 || 2500.00',
                                        '15/01/2019 || 2000.00 ||  || 3000.00',
                                        '15/01/2019 || 1000.00 ||  || 1000.00'])
  end
end
