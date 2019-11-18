# frozen_string_literal: true

class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @balance += amount
    store_deposit(amount)
  end

  def withdraw(amount)
    @balance -= amount
    store_withdrawal(amount)
  end

  private

  def store_deposit(amount)
    @history.push(date: current_date, deposit: amount, balance: @balance)
  end

  def store_withdrawal(amount)
    @history.push(date: current_date, withdrawal: amount, balance: @balance)
  end

  def current_date
    Date.today.strftime("%m/%d/%Y")
  end
end
