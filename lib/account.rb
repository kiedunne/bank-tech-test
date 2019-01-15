# frozen_string_literal: true
require_relative 'transaction'
# Account class handles deposit, withdrawal and balance
class Account
  attr_reader :credit, :debit, :balance, :transactions
  DEFAULT_AMOUNT = 0

  def initialize
    @credit = 0
    @debit = 0
    @balance = DEFAULT_AMOUNT
    @transactions = []
  end

  def deposit(amount)
    @credit = amount
    @balance += amount
    new_transaction
  end

  def withdrawal(amount)
    @debit = amount
    @balance -= amount
    new_transaction
  end

  def new_transaction
    @transactions << [@credit, @debit, @balance]
  end
end
