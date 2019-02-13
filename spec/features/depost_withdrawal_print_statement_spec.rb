# frozen_string_literal: true

require_relative '../helpers/example_statement.rb'
require 'timecop'
require 'account'
require 'statement'

describe 'Feature: Make multiple transactions and see statement' do
  let(:account) { Account.new }
  let(:statement) { Statement.new }
  before do
    Timecop.freeze(Time.local(2019, 1, 16))
  end

  after do
    Timecop.return
  end

  it 'can print a statement multiple times with transactions' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdrawal(500)
    expect(statement.print_statement(account.transactions)).to eq(ex_statement)
    expect(statement.print_statement(account.transactions)).to eq(ex_statement)
  end
end
