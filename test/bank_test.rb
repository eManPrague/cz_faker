require_relative 'test_helper'
require 'cz_faker'

class BankTest < Minitest::Test
  def test_card_number
    assert CzFaker::Validator::Bank.credit_card? CzFaker::Bank.credit_card
    assert CzFaker::Validator::Bank.credit_card? CzFaker::Bank.credit_card(:visa)
    assert CzFaker::Validator::Bank.credit_card? CzFaker::Bank.credit_card(:master_card)
    assert CzFaker::Validator::Bank.credit_card? CzFaker::Bank.credit_card(:maestro)
  end

  def test_account_number
    assert CzFaker::Validator::Bank.account_number? CzFaker::Bank.account_number
    assert CzFaker::Validator::Bank.account_number? CzFaker::Bank.account_number(true)
    assert CzFaker::Validator::Bank.full_account_number? CzFaker::Bank.full_account_number
    assert CzFaker::Validator::Bank.full_account_number? CzFaker::Bank.full_account_number(true)
  end

  def test_bank_code
    assert CzFaker::Bank.bank_code.size == 4
  end
end
