require 'account'

describe Account do

  subject(:account) { described_class.new }
  it 'is created with a balance of 0' do
    expect(account.balance).to eq 0
  end
  it 'is created with a transactions record' do
    expect(account.history).to eq []
  end

  describe '#deposit' do
    it 'allows money to be stored in an account' do
      account.deposit('11/11/19', 100)
      expect(account.balance).to eq 100
    end
    it 'stores a record of the deposit' do
      account.deposit('11/11/19', 100)
      account.deposit('12/11/19', 100)
      expect(account.history).to eq [{date: '11/11/19', deposit: 100, balance: 100}, {date: '12/11/19', deposit: 100, balance: 200}]
    end
  end

  describe '#withdraw' do
    it 'allows money to be withdrawn from an account' do
      account.deposit('11/11/19', 100)
      account.withdraw(100)
      expect(account.balance).to eq 0
    end
  end

end