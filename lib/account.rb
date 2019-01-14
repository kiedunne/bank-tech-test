# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :balance, :date

  def initialize
    @balance = 100
    @amount = 0
    @date = Time.now
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)
    @balance -= amount
  end
end
