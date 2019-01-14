# frozen_string_literal: true

# Transaction class creates individual transactions
class Transaction
  attr_reader :time, :amount, :balance, :transactions

  def initialize(time, amount, balance)
    @time = time
    @amount = amount
    @balance = balance
  end
end