# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  date = Date.today.strftime("%m/%d/%Y")

  it 'is created with a balance of 0' do
    expect(account.balance).to eq 0
  end
  it 'is created with a transactions record' do
    expect(account.history).to eq []
  end

  describe '#deposit' do
    it 'allows money to be stored in an account' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end
    it 'stores a record of the deposit' do
      account.deposit(100)
      account.deposit(100)
      expect(account.history).to eq [{ date: date, deposit: 100, balance: 100 }, { date: date, deposit: 100, balance: 200 }]
    end
  end

  describe '#withdraw' do
    it 'allows money to be withdrawn from an account' do
      account.deposit(100)
      account.withdraw(100)
      expect(account.balance).to eq 0
    end
    it 'stores a record of the withdrawal' do
      account.deposit(100)
      account.withdraw(50)
      account.withdraw(50)
      expect(account.history).to eq [{ date: date, deposit: 100, balance: 100 }, { date: date, withdrawal: 50, balance: 50 }, { date: date, withdrawal: 50, balance: 0 }]
    end
  end
end
