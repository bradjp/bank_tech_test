class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(date, amount)
    @balance += amount
    @history.push({date: "#{date}", deposit: amount, balance: @balance})
  end

  def withdraw(amount)
    @balance -= amount
  end

end