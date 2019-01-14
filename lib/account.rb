# frozen_string_literal: true

# Account class handles balance
class Account
  attr_reader :balance

  def initialize
    @balance = 100
  end
end
