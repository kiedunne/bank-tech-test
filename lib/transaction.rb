# frozen_string_literal: true

# Transaction class creates individual transactions
class Transaction
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(credit = 0, debit = 0, balance = 0)
    @transactions.unshift([Time.new.strftime('%d/%m/%Y'),
                           format('%.2f', credit),
                           format('%.2f', debit),
                           format('%.2f', balance)])
  end
end
