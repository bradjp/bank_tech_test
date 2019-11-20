# frozen_string_literal: true

require 'account'
require 'timecop'

describe Account do
  subject(:account) { described_class.new }

  date = Date.today.strftime('%m/%d/%Y')

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
      expect(account.history).to eq [{ balance: '100.00', date: date, deposit: '100.00', withdrawal: '' }, { balance: '200.00', date: date, deposit: '100.00', withdrawal: '' }]
    end
    it 'ensures a deposit is above 0' do
      account.deposit(100)
      account.deposit(-100)
      expect(account.balance).to eq 100
    end
  end

  describe '#withdraw' do
    it 'allows money to be withdrawn from an account' do
      account.deposit(100)
      account.withdraw(100)
      expect(account.balance).to eq 0
    end
    it 'test' do
      account.deposit(100)
      tomorrow = Timecop.freeze(Date.today + 1).strftime('%m/%d/%Y')
      account.deposit(100)
      Timecop.return
      expect(account.history).to eq [{ balance: '100.00', date: date, deposit: '100.00', withdrawal: '' }, { balance: '200.00', date: tomorrow, deposit: '100.00', withdrawal: '' }]
    end
    it 'stores a record of the withdrawal' do
      account.deposit(100)
      account.withdraw(50)
      account.withdraw(50)
      expect(account.history).to eq [{ balance: '100.00', date: date, deposit: '100.00', withdrawal: '' }, { balance: '50.00', date: date, deposit: '', withdrawal: '50.00' }, { balance: '0.00', date: date, deposit: '', withdrawal: '50.00' }]
    end
    it 'ensures a withdrawal is above 0' do
      account.deposit(100)
      account.withdraw(-100)
      expect(account.balance).to eq 100
    end
    it 'alerts the account holder if a withdrawal is refused due to insufficient funds' do
      account.deposit(100)
      expect { account.withdraw(101) }.to raise_error(RuntimeError, 'Sorry, insufficient funds.')
    end
  end
end
