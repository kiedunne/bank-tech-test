
# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  HEADER = "date || credit || debit || balance\n"

  def print_statement(transactions)
    format_statement(transactions)
  end

  private

  def format_statement(transactions)
    @statement = transactions.map do |transaction|
      transaction.map! do |x|
        x == '0.00' ? '' : x
      end
      transaction.join(' || ') << "\n"
    end
    @statement.unshift(HEADER)
  end
end
