# frozen_string_literal: true

# Account class handles deposit, withdrawal and balance
class Account
  attr_reader :credit, :debit, :balance
  DEFAULT_AMOUNT = 0

  def initialize
    @credit = DEFAULT_AMOUNT
    @debit = DEFAULT_AMOUNT
    @balance = DEFAULT_AMOUNT
  end

  def deposit(amount)
    @credit = amount
    @balance += amount
  end

  def withdrawal(amount)
    @debit = amount
    @balance -= amount
  end
end
