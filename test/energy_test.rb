require_relative 'test_helper'
require 'cz_faker'

class EnergyTest < Minitest::Test
  def test_ean
    assert CzFaker::Validator::Energy.ean? CzFaker::Energy.ean(true, nil)
    assert CzFaker::Validator::Energy.ean? CzFaker::Energy.ean(false, nil)
    assert CzFaker::Validator::Energy.ean? CzFaker::Energy.ean(true, 'EON')
    assert CzFaker::Validator::Energy.ean? CzFaker::Energy.ean(false, 'EON')
  end

  def test_eic
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(true, nil)
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(false, nil)
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(true, 'EON')
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(false, 'EON')
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(true, nil, 'Z')
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(false, 'EON', 'Z')
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(true, nil, 'Z')
    assert CzFaker::Validator::Energy.eic? CzFaker::Energy.eic(false, 'EON', 'Z')
  end
end
