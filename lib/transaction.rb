# frozen_string_literal: true

# Transaction class creates individual transactions
class Transaction
  attr_reader :date, :credit, :debit, :balance, :transaction, :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(credit = 0, debit = 0, balance = 0)
    @transaction = [credit, debit, balance]
    format_transaction
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

  def format_transaction
    @transaction = @transaction.flatten.map do |transaction|
      format('%.2f', transaction)
    end
  end
end
