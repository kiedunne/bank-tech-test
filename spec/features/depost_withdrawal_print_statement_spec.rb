# frozen_string_literal: true

# require 'account'
# require 'statement'
# require 'transaction'
#
# describe 'Feature: Make multiple transactions and see statement' do
#
#   let(:account1) { Account.new }
#   let(:account2) { Account.new }
#   let(:account3) { Account.new }
#   let(:transaction1) { Transaction.new(account1.credit, account1.debit, account1.balance) }
#   let(:transaction2) { Transaction.new(account2.credit, account2.debit, account2.balance) }
#   let(:transaction3) { Transaction.new(account3.credit, account3.debit, account3.balance) }
#   let(:statement1) { Statement.new(transaction1.transactions) }
#   let(:statement2) { Statement.new(transaction2.transactions) }
#   let(:statement3) { Statement.new(transaction3.transactions) }
#
#
#   it 'prints a statement with multiple transactions' do
#     account1.deposit(1000)
#     transaction1.add_transaction
#     account2.deposit(2000)
#     transaction2.add_transaction
#     account3.withdrawal(500)
#     transaction3.add_transaction
#     statement1.print_statement
#     statement2.print_statement
#     statement3.print_statement
#     expect(statement3.statement).to eq(['14/01/2019 ||  || 500 || 2500.00',
#                                        '14/01/2019 || 2000.00 ||  || 3000.00',
#                                        '14/01/2019 || 1000.00 ||  || 1000.00'])
#   end
# end
