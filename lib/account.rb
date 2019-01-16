# frozen_string_literal: true

require_relative 'transactions.rb'
require_relative 'statement.rb'
# Account class handles deposit, withdrawal and balance
class Account
  attr_reader :transactions
  DEFAULT_AMOUNT = 0

  def initialize(transactions = Transactions.new)
    @balance = DEFAULT_AMOUNT
    @transactions = transactions
  end

  def deposit(amount)
    @balance += amount
    @transactions.add_transaction(amount, 0, @balance)
  end

  def withdrawal(amount)
    @balance -= amount
    @transactions.add_transaction(0, amount, @balance)
  end
end
