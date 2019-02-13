
# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :transactions, :statement
  HEADER = "date || credit || debit || balance\n"

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    format_statement
  end

  private

  def format_statement
    @statement = @transactions.map do |transaction|
      transaction.map! do |x|
        x == '0.00' ? '' : x
      end
      transaction.join(' || ') << "\n"
    end
    @statement.unshift(HEADER)
  end
end
