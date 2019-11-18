class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(date, amount)
    @balance += amount
    store_deposit(date, amount)
  end

  def withdraw(date, amount)
    @balance -= amount
    store_withdrawal(date, amount)
  end

  private

  def store_deposit(date, amount)
    @history.push({date: "#{date}", deposit: amount, balance: @balance})
  end

  def store_withdrawal(date, amount)
    @history.push({date: "#{date}", withdrawal: amount, balance: @balance})
  end


end