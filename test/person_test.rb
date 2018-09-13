require_relative 'test_helper'
require 'cz_faker'

class PersonTest < Minitest::Test
  def test_gender
    assert CzFaker::Data::GENDERS.include?(CzFaker::Person.gender)
  end

  def test_birth_number
    assert CzFaker::Validator::Person.birth_number? CzFaker::Person.birth_number
    assert CzFaker::Validator::Person.birth_number? CzFaker::Person.birth_number("1.1.1988")
    assert CzFaker::Validator::Person.birth_number? CzFaker::Person.birth_number(nil, :female, false)
    assert CzFaker::Validator::Person.birth_number? CzFaker::Person.birth_number(nil, nil, false)
    assert CzFaker::Validator::Person.birth_number? CzFaker::Person.birth_number("1.1.1988", :female, false)
    assert CzFaker::Validator::Person.birth_number? CzFaker::Person.birth_number("1.1.1988", :female, true)
    assert CzFaker::Validator::Person.birth_number? CzFaker::Person.birth_number(nil, :female, true)
  end

  def test_drivers_license
    true
  end

  def test_id_number
    true
  end

  def test_religion
    assert_not_nil CzFaker::Person.religion
  end
end
