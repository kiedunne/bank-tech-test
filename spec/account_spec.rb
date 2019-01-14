# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }

  it 'can print initial account balance' do
    expect(account.balance).to eq 100
  end
end
