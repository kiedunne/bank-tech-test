# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :transactions, :statement
  HEADER = 'date || credit || debit || balance'

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    format_statement
    puts HEADER
    @transactions = @statement.each_slice(4).to_a
    @statement = @transactions.map do |transaction|
      transaction.join(' || ')
    end
    puts @statement
  end

  def format_statement
    @statement = @transactions.flatten.map do |x|
      x == '0' ? '' : x
    end
    @statement.each_slice(4).to_a
  end
end
