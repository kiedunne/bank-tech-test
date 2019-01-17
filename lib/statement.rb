
# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :transactions, :statement
  HEADER = "date || credit || debit || balance\n"

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    remove_zeros
  end

  private

  def remove_zeros
    @statement = @transactions.each do |transaction|
      transaction.map! do |x|
        x == '0.00' ? '' : x
      end
    end
    format_statement
  end

  def format_statement
    @statement = @statement.map do |transaction|
      transaction.join(' || ')
    end
    @statement = @statement.each do |x|
      x << "\n"
    end
    @statement.unshift(HEADER)
  end
end
