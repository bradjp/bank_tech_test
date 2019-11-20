# frozen_string_literal: true

describe 'Account management feature test' do
  it 'creates an account and makes transactions' do
    account = Account.new
    account.deposit(100)
    account.withdraw(50)
  end
  it 'creates an account and requests a statement' do
    account = Account.new
    statement = AccountStatement.new
    account.deposit(100)
    statement.display_transactions(account)
  end
end
