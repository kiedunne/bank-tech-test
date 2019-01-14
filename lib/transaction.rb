# frozen_string_literal: true

# Transaction class creates individual transactions
class Transaction
  attr_reader :time, :amount, :balance, :transaction, :transactions

  def initialize(time, amount, balance)
    @time = time
    @amount = amount
    @balance = balance
    @transaction = [time, amount, balance]
    @transactions = []
  end

  def add_transaction
    @transactions.unshift(@transaction)
  end
end
