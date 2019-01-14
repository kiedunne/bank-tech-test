# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :balance, :date

  def initialize
    @balance = 100
    @amount = 0
    @date = Time.now
  end
end
