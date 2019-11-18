require 'account'

describe Account do

  subject(:account) { described_class.new }
  it 'is created with a balance of 0' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'allows money to be stored in an account' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end

  describe '#withdraw' do
    it 'allows money to be withdrawn from an account' do
      account.deposit(100)
      account.withdraw(100)
      expect(account.balance).to eq 0
    end
  end

end