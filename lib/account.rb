# frozen_string_literal: true

require_relative 'transaction.rb'
# Account class handles deposit, withdrawal and balance
class Account
  attr_reader :balance, :transaction
  DEFAULT_AMOUNT = 0

  def initialize(transaction = Transaction.new)
    @balance = DEFAULT_AMOUNT
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    @transaction.add_transaction(amount, 0, @balance)
  end

  def withdrawal(amount)
    @balance -= amount
    @transaction.add_transaction(0, amount, @balance)
  end
end
