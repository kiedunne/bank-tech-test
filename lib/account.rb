# frozen_string_literal: true

require_relative 'transaction.rb'
require_relative 'statement.rb'
# Account class handles deposit, withdrawal and balance
class Account
  attr_reader :transactions
  DEFAULT_AMOUNT = 0

  def initialize
    @balance = DEFAULT_AMOUNT
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.unshift(Transaction.new(amount, 0, @balance).transaction)
  end

  def withdrawal(amount)
    raise 'Not enough funds.' if @balance < amount
    @balance -= amount
    @transactions.unshift(Transaction.new(0, amount, @balance).transaction)
  end
end
