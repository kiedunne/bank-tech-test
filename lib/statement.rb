# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :transactions, :statement
  HEADER = 'date || credit || debit || balance'

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    puts HEADER
    @statement = @transactions.map { |transaction| transaction.join(' || ') }
  end
end
