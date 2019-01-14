# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :transactions, :statement

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    puts 'date || credit || debit || balance'
    puts @transactions.map { |transaction| transaction.join(' || ') }
  end
end
