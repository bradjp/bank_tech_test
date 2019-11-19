# frozen_string_literal: true

require_relative 'account'

class AccountStatement
  def display_transactions(account)
    puts statement_header + statement_body(account)
  end

  private

  def statement_header
    "date || credit || debit || balance\n"
  end

  def statement_body(account)
    account.history.reverse.map { |entry| "#{entry[:date]} || #{entry[:deposit]} || #{entry[:withdrawal]} || #{entry[:balance]}" }.join("\n")
  end
end
