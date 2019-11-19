# frozen_string_literal: true

require_relative 'account'

class AccountStatement
  def display(account)
    puts "date || credit || debit || balance"
    account.history.reverse.map { |entry| "#{entry[:date]}" + " || " + "#{entry[:deposit]}" + " || " + "#{entry[:withdrawal]}" + " || " + "#{entry[:balance]}" }.join
  end
end
