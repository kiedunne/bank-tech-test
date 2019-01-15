# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :balance
  DEFAULT_AMOUNT = 0

  def initialize
    @balance = DEFAULT_AMOUNT
    @credit = 0
    @debit = 0
  end

  def deposit(amount)
    new_credit(amount)
    @balance += amount
  end

  def withdrawal(amount)
    new_debit(amount)
    @balance -= amount
  end

  private

  def new_credit(amount)
    @credit = amount
  end

  def new_debit(amount)
    @debit = amount
  end
end
