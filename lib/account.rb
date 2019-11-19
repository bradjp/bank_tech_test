# frozen_string_literal: true

require 'date'

class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    return if amount <= 0

    @balance += amount
    store_deposit(amount)
  end

  def withdraw(amount)
    return if amount <= 0
    raise 'Sorry, insufficient funds.' if amount > @balance

    @balance -= amount
    store_withdrawal(amount)
  end

  private

  def store_deposit(amount)
    @history.push(date: current_date, deposit: format('%.2f', amount), balance: format('%.2f', @balance), withdrawal: '')
  end

  def store_withdrawal(amount)
    @history.push(date: current_date, withdrawal: format('%.2f', amount), balance: format('%.2f', @balance), deposit: '')
  end

  def current_date
    Date.today.strftime('%m/%d/%Y')
  end
end
