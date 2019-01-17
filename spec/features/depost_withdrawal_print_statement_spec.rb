# frozen_string_literal: true

require_relative '../helpers/example_statement.rb'
require 'timecop'
require 'account'
require 'statement'
require 'transaction'

describe 'Feature: Make multiple transactions and see statement' do
  let(:account) { Account.new }
  let(:statement) { Statement.new(account.transactions) }

  before do
    Timecop.freeze(Time.local(2019, 1, 16))
  end

  after do
    Timecop.return
  end

  it 'can make multiple withdrawals and deposits and see statement' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdrawal(500)
    statement.print_statement
    expect(statement.statement).to eq(example_statement)
  end
  it 'can print statement twice' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdrawal(500)
    statement.print_statement
    statement.print_statement
    expect(statement.statement).to eq(example_statement)
  end
end
