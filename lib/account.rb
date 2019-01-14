# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :balance, :transactions, :amount, :statement

  def initialize
    @balance = 0
    @amount = 0
    @transactions = []
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
    @transactions << [Time.now, @amount, @balance]
    # (Time.new).strftime(%d%m%Y)
  end

  def print_statement
    header
    @statement = @transactions.map { |transaction| transaction.join(' || ') }
  end

  def header
    puts 'date || credit || debit || balance'
  end
end
