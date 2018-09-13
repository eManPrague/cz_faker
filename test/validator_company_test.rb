require_relative 'test_helper'
require 'cz_faker'

class ValidatorCompanyTest < Minitest::Test
  def test_ico
    assert CzFaker::Validator::Company.ico? '74594061'
    assert_not CzFaker::Validator::Company.ico? '7459406'
    assert_not CzFaker::Validator::Company.ico? '74594062'
  end

  def test_dic
    assert CzFaker::Validator::Company.dic? 'CZ74594061'
    assert_not CzFaker::Validator::Company.dic? 'XX74594061'
    assert_not CzFaker::Validator::Company.dic? '74594061'
    assert_not CzFaker::Validator::Company.dic? 'C7459406'
  end
end
