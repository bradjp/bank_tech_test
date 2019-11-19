# frozen_string_literal: true

require 'account_statement'

describe AccountStatement do
  subject(:statement) { described_class.new }

  date = Date.today.strftime('%m/%d/%Y')

  it 'should print a bank statement header' do
    account = double(balance: 100, history: [{ date: date, deposit: '100.00', balance: '100.00' }])
    expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n#{date} || 100.00 ||  || 100.00")
    statement.display_transactions(account)
  end
end
