# frozen_string_literal: true

require_relative 'transaction.rb'
require_relative 'statement.rb'
# Account class handles deposit, withdrawal and balance
class Account
  DEFAULT_AMOUNT = 0
  def initialize(record = Transaction.new)
    @balance = DEFAULT_AMOUNT
    @record = record
  end

  def deposit(amount)
    error_check(amount)
    @balance += amount
    @record.add_transaction(amount, 0, @balance)
  end

  def withdrawal(amount)
    error_check(amount)
    overdraft_check(amount)
    @balance -= amount
    @record.add_transaction(0, amount, @balance)
  end

  def transactions
    @record.transactions
  end

  private

  def error_check(amount)
    raise 'Not an integer.' if amount.is_a?(Integer) == false
  end

  def overdraft_check(amount)
    raise 'Not enough funds.' if @balance < amount
  end
end
