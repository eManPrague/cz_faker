require_relative 'test_helper'
require 'cz_faker'

class ValidatorEnergyTest < Minitest::Test
  def test_ean
    assert CzFaker::Validator::Energy.ean? '859182400439670886'
    assert_not CzFaker::Validator::Energy.ean? '888182400439670886'
    assert_not CzFaker::Validator::Energy.ean? '859182400439670883'
    assert_not CzFaker::Validator::Energy.ean? '85918200043967088'
  end

  def test_eic
    assert CzFaker::Validator::Energy.eic? '27ZG187N2183684F'
    assert_not CzFaker::Validator::Energy.eic? '27XG-PPD-DSO-CZE'
    assert_not CzFaker::Validator::Energy.eic? '27ZG187N2183684G'
    assert_not CzFaker::Validator::Energy.eic? '27ZGX87N2183684F'
    assert_not CzFaker::Validator::Energy.eic? '27ZGX87N2183684'
  end
end
