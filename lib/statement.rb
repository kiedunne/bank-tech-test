# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :transactions, :statement
  HEADER = 'date || credit || debit || balanc e'

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement(transactions)
    remove_zeros(transactions)
    format_transaction
    format_statement
    puts HEADER
    puts @statement
  end

  def remove_zeros(transactions)
    @statement = transactions.flatten.map do |x|
      x == '0.00' ? '' : x
    end
  end

  def format_transaction
    @statement = @statement.each_slice(4).to_a
  end

  def format_statement
    @statement = @statement.map do |transaction|
      transaction.join(' || ')
    end
  end
end
