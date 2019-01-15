# frozen_string_literal: true

# Transaction class creates individual transactions
class Transaction
  attr_reader :date, :credit, :debit, :balance, :transaction, :transactions

  def initialize(credit, debit, balance)
    @credit = format('%.2f', credit)
    @debit = format('%.2f', debit)
    @balance = format('%.2f', balance)
    @transaction = [@credit, @debit, @balance]
    @transactions = []
  end

  def add_transaction
    add_date
    @transactions.unshift(@transaction)
  end

  def add_date
    set_date
    @transaction.unshift(@date)
  end

  def set_date
    @date = Time.new.strftime('%d/%m/%Y')
  end
end
