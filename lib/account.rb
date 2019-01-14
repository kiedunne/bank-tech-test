# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :balance, :statement, :amount

  def initialize
    @balance = 0
    @amount = 0
    @statement = []
  end

  def deposit(amount)
    @amount = amount
    @balance += @amount
    update_statement
  end

  def withdrawal(amount)
    @amount = amount
    @balance -= amount
    update_statement
  end

  def update_statement
    @statement << [Time.now, @amount, @balance]
  end
end
