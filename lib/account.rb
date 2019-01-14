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
    @balance += amount
    @amount = format('%.2f', amount) + ' ||'
    update_statement
  end

  def withdrawal(amount)
    @balance -= amount
    @amount = '|| ' + format('%.2f', amount)
    update_statement
  end

  def update_statement
    @time = Time.new.strftime('%d/%m/%Y')
    @transactions.unshift([@time, @amount, format('%.2f', @balance)])
  end

  def print_statement
    @statement = @transactions.map { |transaction| transaction.join(' || ') }
    header
    puts @statement
  end

  def header
    puts 'date || credit || debit || balance'
  end
end
