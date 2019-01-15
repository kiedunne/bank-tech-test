# frozen_string_literal: true

require_relative 'transaction.rb'
# Account class handles deposit, withdrawal and balance
class Account
  attr_reader :credit, :debit, :balance, :transaction
  DEFAULT_AMOUNT = 0

  def initialize(transaction = Transaction.new)
    @credit = 0
    @debit = 0
    @balance = DEFAULT_AMOUNT
    @transaction = transaction
  end

  def deposit(amount)
    @credit = amount
    @balance += amount
    @transaction.add_transaction(@credit, 0, @balance)
  end

  def withdrawal(amount)
    @debit = amount
    @balance -= amount
    transaction.add_transaction(0, @debit, @balance)
  end
end
