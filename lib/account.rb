# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :balance
  DEFAULT_AMOUNT = 0

  def initialize
    @balance = DEFAULT_AMOUNT
    @credit = DEFAULT_AMOUNT
    @debit = DEFAULT_AMOUNT
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
