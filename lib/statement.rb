# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :transactions, :statement
  HEADER = 'date || credit || debit || balance'

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement(a)
    remove_zeros(a)
    format_transaction
    format_statement
    puts HEADER
    puts @statement
  end

  def remove_zeros(a)
    @statement = a.flatten.map do |x|
      x == '0' ? '' : x
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
