require_relative 'test_helper'
require 'cz_faker'

class CompanyTest < Minitest::Test
  def test_ico
    assert CzFaker::Validator::Company.ico? CzFaker::Company.ico
    assert CzFaker::Validator::Company.dic? CzFaker::Company.dic
  end
end
