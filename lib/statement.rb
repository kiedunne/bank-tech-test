# frozen_string_literal: true

# Statement class prints a statement of all transactions
class Statement
  attr_reader :statement
  HEADER = 'date || credit || debit || balance'

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement(transactions)
    format_transaction(transactions)
    format_statement
  end

  private

  def format_transaction(transactions)
    @statement = transactions.each do |txn|
      remove_zeros(txn)
    end
  end

  def remove_zeros(transaction)
    transaction.map! do |x|
      x == '0.00' ? '' : x
    end
  end

  def format_statement
    @statement.map! do |transaction|
      transaction.join(' || ')
    end
    @statement.unshift(HEADER)
  end
end
