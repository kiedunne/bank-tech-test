# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :date, :amount, :balance, :debit, :credit
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(amount)
    new_credit(amount)
    set_date
    @balance += amount
  end

  def withdrawal(amount)
     new_debit(amount)
    set_date
    @balance -= amount
  end

  private

  def set_date
    @date = Time.new.strftime('%d/%m/%Y')
  end

  def new_credit(amount)
    @credit = amount
  end

  def new_debit(amount)
    @debit = amount
  end
  #
  #
  # def format_deposit(amount)
  #   @amount = format('%.2f', amount)
  # end
  #
  #
  # def format_withdrawal(amount)
  #   @amount = format('%.2f', amount)
  # end
  #
  # def format_balance
  #   @balance = format('%.2f', @balance)
  # end
end
